import os
from utils.face.train_face import train_face
from flask_login import current_user
from flask import Blueprint, jsonify, request
import face_recognition
from utils.db.database import driver

face_bp = Blueprint('face', __name__)

@face_bp.route('/submit-faces', methods=['POST'])
def submit_faces():
    try:
        current_user_id = current_user.id
        jsonData = request.get_json()
        liked_faces = jsonData.get('likedFaces')
        disliked_faces = jsonData.get('dislikedFaces')

        with driver.session() as session:
            # Use a loop to create liked faces relationships
            for face_id in liked_faces:
                session.run(
                    f"""MATCH (u:User {{id: '{current_user_id}'}}), (f:Face {{name: '{face_id}'}})
                        CREATE (u)-[:LIKES]->(f)"""
                )

            # Use a loop to create disliked faces relationships
            for face_id in disliked_faces:
                session.run(
                    f"""MATCH (u:User {{id: '{current_user_id}'}}), (f:Face {{name: '{face_id}'}})
                        CREATE (u)-[:DISLIKES]->(f)"""
                )

        return jsonify({"message": 'Finished submitting!'}), 200

    except Exception as e:
        print(f'Error: {str(e)}')
        return 'Error executing Python script', 500


@face_bp.route('/train-face', methods=['POST'])
def train_faces():
    try:
        current_user_id = current_user.id

        with driver.session() as session:
            # Fetch liked faces for the current user
            liked_faces_result = session.run(
                f"MATCH (u:User {{id: '{current_user_id}'}})-[:LIKES]->(f:Face) RETURN f.name AS liked_face", current_user_id=current_user_id)
            liked_faces = [record['liked_face']
                           for record in liked_faces_result]

            # Fetch disliked faces for the current user
            disliked_faces_result = session.run(
                f"MATCH (u:User {{id: '{current_user_id}'}})-[:DISLIKES]->(f:Face) RETURN f.name AS disliked_face", current_user_id=current_user_id)
            disliked_faces = [record['disliked_face']
                              for record in disliked_faces_result]

            # Call the train_face function to train the model
            train_face(current_user_id, liked_faces, disliked_faces)

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
        if file.filename == '':
            return jsonify({"error": "No file selected"}), 400

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

        # Update the user's face_vector property in the database
        with driver.session() as session:
            session.run(
                f"""
                MATCH (u:User {{id: '{current_user.id}'}})
                SET u.face_vector = {face_vector.tolist() if face_vector else None}
                """
            )

        return jsonify({"message": "Face uploaded and processed successfully"}), 200

    except Exception as e:
        print(e)
        return jsonify({"error": f"An error occurred while processing the image: {e}"}), 500
