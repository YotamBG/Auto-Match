from flask import Blueprint, request, jsonify, session
from utils.db.db_models import users
from utils.db.database import db
from flask_login import current_user, login_user, logout_user, login_required

reels_bp = Blueprint('reels', __name__)


@reels_bp.route('/submitReels', methods=['POST'])
def submit_reels():
    # replace with middleware
    id = current_user.id
    user = users.query.filter_by(id=id).first()

    # Get the email and reels data from the request
    data = request.get_json()
    email = user.email
    reels = data.get('reels')

    print(f'email = {email}')
    print(f'reels = {reels}')

    try:
        # Find the user by email
        user = users.query.filter_by(email=email).first()

        if user:
            # Convert the 'liked_songs' column to a Python list (if not already)
            # liked_songs = user.liked_songs if user.liked_songs else []

            # print(liked_songs)
            # Append the submitted reels to the liked_songs list
            # liked_songs.extend(reels)
            # print(liked_songs)

            # Update the 'liked_songs' field with the modified list
            user.liked_reels = reels

            # Commit the changes to the database
            db.session.commit()

            return jsonify({"message": "Reels submitted successfully"}), 200
        else:
            return jsonify({"error": "User not found"}), 404

    except Exception as e:
        return jsonify({"error": "An error occurred while submitting reels"}), 500
