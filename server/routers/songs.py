from flask import Blueprint, request, jsonify
from flask_login import current_user
from .match import update_relationship_count
from utils.db.database import driver
from utils.songs.spotify import convert_playlist

songs_bp = Blueprint('songs', __name__)


@songs_bp.route('/submit-songs', methods=['POST'])
def submit_songs():
    try:
        # Get the user's ID from Flask-Login
        print('ok0')
        print(f'ok1 {current_user.get_id()}')
        user_id = current_user.get_id()
        print('ok2')

        # Get the songs data from the request
        data = request.get_json()
        songs = convert_playlist(data.get('songs'))

        with driver.session() as session:
            # Create or update relationships between the user and songs
            for song in songs:
                if song['name'] and song['artist'] and song['link']:
                    
                    session.run(
                        f"""
                        MATCH (u:User {{id: '{user_id}'}})
                        MERGE (s:Song {{id: '{song['id']}'}})
                        SET s.name = '{song['name'].replace("'", "")}', s.artist = '{song['artist'].replace("'", "")}', s.link = '{song['link'].replace("'", "")}'
                        MERGE (u)-[:LIKES]->(s)
                        """
                    )

        print('ok0')
        update_relationship_count(user_id, 'LIKES', 'Song')

        return jsonify({"message": "Songs submitted successfully"}), 200
    except Exception as e:
        return jsonify({"error": "An error occurred while submitting songs"}), 500
