import subprocess
from flask import Blueprint, request, jsonify
from utils.face.score_face import score_face
from utils.music.score_music import score_music
from utils.reels.score_reels import score_reels
from utils.db.db_models import users, matches
from sqlalchemy import or_, and_
from utils.db.database import db
from flask_login import current_user, login_user, logout_user, login_required


match_bp = Blueprint('match', __name__)


@match_bp.route('/match-search', methods=['POST'])
def match_search():
    try:
        # retrive past matches !

        # fetch from current_user (flask-login)
        user_id = request.json['user_id']
        # fetch them instead from the DB by location (with total score!)
        candidates_ids = request.json['candidates_ids']

        # Initialize a list to store the analyzed matches
        analyzed_matches = []

        # Analyze face matches, music matches, and reels matches for all candidates at once
        face_match_scores = score_face(user_id, candidates_ids)
        music_match_scores = score_music(user_id, candidates_ids)
        reels_match_scores = score_reels(user_id, candidates_ids)

        for i, candidate_id in enumerate(candidates_ids):
            face_match_score = face_match_scores[i]
            music_match_score = music_match_scores[i]
            reels_match_score = reels_match_scores[i]

            total_score = (face_match_score +
                           music_match_score + reels_match_score) / 3
            # total_score = (music_match_score + reels_match_score) / 2

            analyzed_matches.append({
                'current_user_id': user_id,
                'candidate_user_id': candidate_id,
                'face_match_percent': face_match_score,
                'reels_match_percent': reels_match_score,
                'songs_match_percent': music_match_score,
                'total_match_percent': total_score
            })

        # Save the analyzed matches to the database
        # Save the analyzed matches to the Matches table
        for match_data in analyzed_matches:
            match = matches(**match_data)
            db.session.add(match)

        db.session.commit()

        # Sort the analyzed matches by total score in descending order
        analyzed_matches.sort(
            key=lambda x: x['total_match_percent'], reverse=True)

        # return only top N matches?

        # Return all analyzed matches
        return jsonify({
            'message': 'Match search completed successfully',
            'analyzed_matches': analyzed_matches
        }), 200

    except Exception as e:
        print('error:')
        print(e)
        return jsonify({'error': str(e)}), 500



@match_bp.route('/match-fetch', methods=['GET'])
def match_fetch():
    try:
        # Get the current user's ID using Flask-Login's current_user
        current_user_id = current_user.id
        # current_user_id = 53
        # current_user = users.query.filter_by(id=current_user_id).first()

        # Get the current user's filters
        current_user_filters = current_user.filters

        # Filter only the filters marked with 1 or 2 (bonus / must)
        active_filters = [filter_name for filter_name,
                          filter_value in current_user_filters.items() if filter_value in [1, 2]]

        print('active_filters:')
        print(active_filters)
        # Get all matches for the current user
        potential_matches = matches.query.filter(
            matches.current_user_id == current_user_id).all()
        print('potential_matches:')
        print(potential_matches)

        # Use the checkMatch function to filter matches based on active_filters
        filtered_matches = checkMatch(potential_matches, active_filters)
        print('filtered_matches:')
        print(filtered_matches)

        verified_matches = []
        for match in filtered_matches:
            candidate_user = users.query.filter_by(id=match.candidate_user_id).first()
            candidate_user_filters = candidate_user.filters
            candidate_user_active_filters = [filter_name for filter_name, filter_value in candidate_user_filters.items() if filter_value in [2]]
            Match = matches.query.filter((matches.current_user_id == match.candidate_user_id) &(matches.candidate_user_id == current_user_id)).first()
            reciprocity = checkMatch([Match], candidate_user_active_filters)
            if reciprocity: # if not empty array
                verified_matches.append(match)

        print('verified_matches:')
        print(verified_matches)
        # Serialize the filtered matches into a JSON format
        serialized_matches = []
        for match in verified_matches:
            serialized_match = {
                'current_user_id': match.current_user_id,
                'candidate_user_id': match.candidate_user_id,
                'candidate_user_name': users.query.filter_by(id=match.candidate_user_id).first().name,
                'face_match_percent': match.face_match_percent,
                'music_match_percent': match.songs_match_percent,
                'reels_match_percent': match.reels_match_percent,
                'decision': match.decision
            }
            serialized_matches.append(serialized_match)

        return jsonify({'matches': serialized_matches}), 200

    except Exception as e:
        print(e)
        return jsonify({'error': 'An error occurred while fetching matches'}), 500


def checkMatch(matches, filters):
    valid_matches = []
    print("checkmatch!")
    print('matches:')
    print(matches)
    print('filters:')
    print(filters)
    print()


    for match in matches:
        valid = True

        for filter_name in filters:
            # Define the column name based on the filter_name
            column_name = f"{filter_name}_match_percent"

            # Check if the score in the match object is above 50
            print(f"{match} / {column_name} = {getattr(match, column_name, 0)}")
            if getattr(match, column_name, 0) < 50:
                valid = False
                break

        if valid:
            valid_matches.append(match)

    return valid_matches






@match_bp.route('/match-fetch-all', methods=['GET'])
def match_fetch_all():
    try:
        # Get the current user's ID using Flask-Login's current_user
        current_user_id = current_user.id
        # current_user_id = 53
        # current_user = users.query.filter_by(id=current_user_id).first()

        print('active_filters:')
        # print(active_filters)
        # Get all matches for the current user
        potential_matches = matches.query.filter(
            matches.current_user_id == current_user_id).all()
        print('potential_matches:')
        print(potential_matches)

        # Use the checkMatch function to filter matches based on active_filters
        # filtered_matches = checkMatch(potential_matches, active_filters)
        print('filtered_matches:')

        # Serialize the filtered matches into a JSON format
        serialized_matches = []
        for match in potential_matches:
            serialized_match = {
                'current_user_id': match.current_user_id,
                'candidate_user_id': match.candidate_user_id,
                'candidate_user_name': users.query.filter_by(id=match.candidate_user_id).first().name,
                'face_match_percent': match.face_match_percent,
                'music_match_percent': match.songs_match_percent,
                'reels_match_percent': match.reels_match_percent,
                'decision': match.decision
            }
            serialized_matches.append(serialized_match)

        return jsonify({'matches': serialized_matches}), 200

    except Exception as e:
        print(e)
        return jsonify({'error': 'An error occurred while fetching matches'}), 500



@match_bp.route('/match-search-all', methods=['POST'])
def match_search_all():
    try:
        # Retrieve the current user's ID
        user_id = current_user.id

        # Delete existing matches for the current user
        matches.query.filter(matches.current_user_id == user_id).delete()

        # Retrieve all candidate IDs (excluding the current user)
        candidates = users.query.filter(users.id != user_id).all()
        candidates_ids = [candidate.id for candidate in candidates]

        # Initialize a list to store the analyzed matches
        analyzed_matches = []

        # Initialize the scores arrays with zeros
        face_match_scores = [0] * len(candidates_ids)
        music_match_scores = [0] * len(candidates_ids)
        reels_match_scores = [0] * len(candidates_ids)

        # Analyze face matches, music matches, and reels matches for all candidates
        try:
            face_match_scores = score_face(user_id, candidates_ids)
            print('ok')
        except Exception as e:
            print(f'Error in scoring face matches: {str(e)}')

        try:
            music_match_scores = score_music(user_id, candidates_ids)
            print('ok2')
        except Exception as e:
            print(f'Error in scoring music matches: {str(e)}')

        try:
            reels_match_scores = score_reels(user_id, candidates_ids)
            print('ok3')
        except Exception as e:
            print(f'Error in scoring reels matches: {str(e)}')

        # add error handling, insert a list of zeros as long as candidates_ids instead when catching

        for i, candidate_id in enumerate(candidates_ids):
            face_match_score = face_match_scores[i]
            music_match_score = music_match_scores[i]
            reels_match_score = reels_match_scores[i]

            total_score = (face_match_score +
                           music_match_score + reels_match_score) / 3

            analyzed_matches.append({
                'current_user_id': user_id,
                'candidate_user_id': candidate_id,
                'face_match_percent': face_match_score,
                'reels_match_percent': reels_match_score,
                'songs_match_percent': music_match_score,
                'total_match_percent': total_score
            })

        # Save the analyzed matches to the Matches table
        for match_data in analyzed_matches:
            match = matches(**match_data)
            db.session.add(match)

        db.session.commit()

        # Sort the analyzed matches by total score in descending order
        analyzed_matches.sort(key=lambda x: x['total_match_percent'], reverse=True)

        print('analyzed_matches:')
        print(analyzed_matches)
        
        

        # Return all analyzed matches
        return jsonify({
            'message': 'Match search completed successfully',
            'analyzed_matches': analyzed_matches
        }), 200

    except Exception as e:
        print('error:')
        print(e)
        return jsonify({'error': str(e)}), 500



@match_bp.route('/match-search-all-all', methods=['POST'])
def match_search_all_all():
    try:
        # Retrieve all users
        all_users = users.query.all()

        for current_user in all_users:
            # Retrieve the current user's ID
            user_id = current_user.id

            # Delete existing matches for the current user
            matches.query.filter(matches.current_user_id == user_id).delete()

            # Retrieve all candidate IDs (excluding the current user)
            candidates_ids = [candidate.id for candidate in all_users if candidate.id != user_id]

            # Initialize the scores arrays with zeros
            face_match_scores = [0] * len(candidates_ids)
            music_match_scores = [0] * len(candidates_ids)
            reels_match_scores = [0] * len(candidates_ids)

            # Analyze face matches, music matches, and reels matches for all candidates
            try:
                face_match_scores = score_face(user_id, candidates_ids)
                print('ok')
            except Exception as e:
                print(f'Error in scoring face matches: {str(e)}')

            try:
                music_match_scores = score_music(user_id, candidates_ids)
                print('ok2')
            except Exception as e:
                print(f'Error in scoring music matches: {str(e)}')

            try:
                reels_match_scores = score_reels(user_id, candidates_ids)
                print('ok3')
            except Exception as e:
                print(f'Error in scoring reels matches: {str(e)}')

            # add error handling, insert a list of zeros as long as candidates_ids instead when catching

            for i, candidate_id in enumerate(candidates_ids):
                face_match_score = face_match_scores[i]
                music_match_score = music_match_scores[i]
                reels_match_score = reels_match_scores[i]

                total_score = (face_match_score +
                               music_match_score + reels_match_score) / 3

                # Save the analyzed match to the Matches table
                match_data = {
                    'current_user_id': user_id,
                    'candidate_user_id': candidate_id,
                    'face_match_percent': face_match_score,
                    'reels_match_percent': reels_match_score,
                    'songs_match_percent': music_match_score,
                    'total_match_percent': total_score
                }

                match = matches(**match_data)
                db.session.add(match)
                db.session.commit()

    except Exception as e:
        print('error:')
        print(e)
        return jsonify({'error': str(e)}), 500

    # Sort the analyzed matches by total score in descending order
    analyzed_matches.sort(key=lambda x: x['total_match_percent'], reverse=True)

    print('analyzed_matches:')
    print(analyzed_matches)

    # Return all analyzed matches
    return jsonify({
        'message': 'Match search completed successfully',
        'analyzed_matches': analyzed_matches
    }), 200


@match_bp.route('/get-match/<int:current_user_id>/<int:candidate_user_id>', methods=['GET'])
def get_match(current_user_id, candidate_user_id):
    try:
        # Search for the match based on current_user_id and candidate_user_id
        match = matches.query.filter(
            (matches.current_user_id == current_user_id) &
            (matches.candidate_user_id == candidate_user_id)
        ).first()

        if match is None:
            return jsonify({'error': 'Match not found'}), 404

        # Retrieve the common reels and songs for the current and candidate users
        current_user = users.query.get(current_user_id)
        candidate_user = users.query.get(candidate_user_id)

        # Initialize sets for liked reels and songs
        current_user_liked_reels = set()
        current_user_liked_songs = set()
        candidate_user_liked_reels = set()
        candidate_user_liked_songs = set()

        # Check if the current user has liked reels and songs
        if current_user.liked_reels:
            current_user_liked_reels = set(reel['url'] for reel in current_user.liked_reels)
        if current_user.liked_songs:
            current_user_liked_songs = set(song['id'] for song in current_user.liked_songs)

        # Check if the candidate user has liked reels and songs
        if candidate_user.liked_reels:
            candidate_user_liked_reels = set(reel['url'] for reel in candidate_user.liked_reels)
        if candidate_user.liked_songs:
            candidate_user_liked_songs = set(song['id'] for song in candidate_user.liked_songs)

        # Find common reels and songs
        common_reels = list(current_user_liked_reels & candidate_user_liked_reels)
        common_songs = list(current_user_liked_songs & candidate_user_liked_songs)

        match_data = {
            'current_user_id': current_user_id,
            'candidate_user_id': candidate_user_id,
            'face_match_percent': match.face_match_percent,
            'reels_match_percent': match.reels_match_percent,
            'songs_match_percent': match.songs_match_percent,
            'total_match_percent': match.total_match_percent,
            'common_reels': common_reels,
            'common_songs': common_songs
        }

        return jsonify(match_data)

    except Exception as e:
        return jsonify({'error': str(e)}), 500
