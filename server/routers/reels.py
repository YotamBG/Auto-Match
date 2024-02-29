from flask import Blueprint, request, jsonify
from flask_login import current_user
from .match import update_relationship_count
from utils.db.database import driver
from utils.reels.instagram import fetch_reels


reels_bp = Blueprint('reels', __name__)


@reels_bp.route('/submit-reels', methods=['POST'])
def submit_reels():
    try:
        # Get the user's ID from Flask-Login
        user_id = current_user.id

        # Get the username and password from the request
        data = request.get_json()
        ig_username = data.get('username')
        ig_password = data.get('password')

        # Fetch reels using Instagram API (you need to implement this)
        reels = fetch_reels(ig_username, ig_password)

        with driver.session() as session:
            # Create or update relationships between the user and reels
            for reel in reels:
                session.run(
                    f"""
                    MATCH (u:User {{id: '{user_id}'}})
                    MERGE (r:Reel {{id: {reel['id'].replace("'", "")}, link: {reel['link'].replace("'", "")}}})
                    MERGE (u)-[:LIKES]->(r)
                    """
                )

        update_relationship_count(user_id, 'LIKES', 'Reel')

        return jsonify({"message": "Reels submitted successfully"}), 200
    except Exception as e:
        return jsonify({"error": "An error occurred while submitting reels"}), 500
