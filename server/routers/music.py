from flask import Blueprint, request, jsonify, session
from utils.db.db_models import users
from utils.music.spotify import convert_playlist
from utils.db.database import db
import requests
import json
from flask_login import current_user, login_user, logout_user, login_required

music_bp = Blueprint('music', __name__)


@music_bp.route('/submit-music', methods=['POST'])
def submit_music():
    # replace with middleware
    id = current_user.id
    user = users.query.filter_by(id=id).first()

    # Get the email and music data from the request
    data = request.get_json()
    email = user.email
    music = convert_playlist(data.get('music'))
    # music = ['song1', 'song2', 'song3']

    print(f'email = {email}')
    print(f'music = {music}')

    try:
        # Find the user by email
        user = users.query.filter_by(email=email).first()

        if user:
            # Convert the 'liked_songs' column to a Python list (if not already)
            # liked_songs = user.liked_songs if user.liked_songs else []

            # print(liked_songs)
            # Append the submitted music to the liked_songs list
            # liked_songs.extend(music)
            # print(liked_songs)

            # Update the 'liked_songs' field with the modified list
            # user.liked_songs = music

            
            if user.liked_songs is None:
                user.liked_songs = []

            # Extend the user's liked_songs
            user.liked_songs = user.liked_songs + music

            # Commit the changes to the database
            db.session.commit()

            return jsonify({"message": "Music submitted successfully"}), 200
        else:
            return jsonify({"error": "User not found"}), 404

    except Exception as e:
        return jsonify({"error": "An error occurred while submitting music"}), 500