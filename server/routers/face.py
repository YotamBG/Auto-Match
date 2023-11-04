import json
import os
import subprocess
from utils.db.db_models import users
from utils.face.train_face import train_face
from utils.db.database import db
from flask_login import current_user, login_user, logout_user, login_required
from flask import Blueprint, request, jsonify, current_app, session
import face_recognition

face_bp = Blueprint('face', __name__)

@face_bp.route('/submit-faces', methods=['POST'])
def submit_faces():
    try:
        id = current_user.id
        user = users.query.filter_by(id=id).first()
        jsonData = request.get_json()
        liked_faces = jsonData.get('likedFaces')
        noped_faces = jsonData.get('nopedFaces')

        # Initialize liked_faces and noped_faces as empty lists if they are None
        if user.liked_faces is None:
            user.liked_faces = []
        if user.noped_faces is None:
            user.noped_faces = []

        # Extend the user's liked_faces and noped_faces
        user.liked_faces = user.liked_faces + liked_faces
        user.noped_faces = user.noped_faces + noped_faces
        
        db.session.commit()

        return jsonify({"message": 'Finished submitting!'}), 200

    except Exception as e:
        print(f'Error: {str(e)}')
        return 'Error executing Python script', 500


@face_bp.route('/train-face', methods=['POST'])
def train_faces():
    try:
        id = current_user.id
        user = users.query.filter_by(id=id).first()
        liked_faces = user.liked_faces
        noped_faces = user.noped_faces

        # Call the train_face function to train the model
        train_face(id, liked_faces, noped_faces)

        return jsonify({"message": 'Finished training!'}), 200

    except Exception as e:
        print(f'Error: {str(e)}')
        return 'Error executing Python script', 500    


@face_bp.route('/submit-face', methods=['POST'])
def submit_face():
    print('ok')
    try:
        # Get the uploaded image file
        file = request.files['face']

        # Check if the file exists and is an allowed format (e.g., PNG or JPEG)
        # Define the upload directory (e.g., storage/user_id)
        upload_dir = os.path.join('../../storage', str(current_user.id))
        print('upload_dir:')
        print(upload_dir)
        os.makedirs(upload_dir, exist_ok=True)
        # Save the uploaded file to the user's directory
        filename = os.path.join(upload_dir, 'profilePic.png')
        file.save(filename)
        # Load the uploaded image using face_recognition library
        uploaded_image = face_recognition.load_image_file(filename)
        # Compute the face vector
        face_encodings = face_recognition.face_encodings(uploaded_image)

        if face_encodings:
            face_vector = face_encodings[0]
        else:
            face_vector = None

        # Update the user's face_vector column in the database
        face_vector_list = face_vector.tolist()
        current_user.face_vector = face_vector_list
        db.session.commit()

        return jsonify({"message": "Face uploaded and processed successfully"}), 200
    
    except Exception as e:
        print(e)
        return jsonify({"error": "An error occurred while processing the image {e}"}), 500
