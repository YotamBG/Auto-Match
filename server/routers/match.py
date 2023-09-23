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


# @match_bp.route('/match-fetch', methods=['GET'])
# def match_fetch():
#     try:
#         # Get the user's ID from the request or your authentication mechanism
#         # user_id = request.args.get('user_id')
#         user_id = current_user.id

#         # Define filters based on query parameters (e.g., 'face', 'music', 'reels')
#         filters_string = request.args.get('filters', default='', type=str)

#         # Split the filters_string into a list using commas
#         filters = filters_string.split(',')

#         print(user_id)
#         print(filters)

#         # Create the base query to fetch matches
#         base_query = matches.query.filter(
#             (matches.current_user_id == user_id) &
#             (matches.decision.is_(None))
#         )

#         # Initialize a dictionary to map filter names to their corresponding model columns
#         filter_column_mapping = {
#             'face': matches.face_match_percent,
#             'music': matches.songs_match_percent,
#             'reels': matches.reels_match_percent,
#         }

#         # Initialize a list of filter conditions
#         filter_conditions = []

#         # Iterate through selected filters and add conditions to the list
#         for filter_name in filters:
#             filter_column = filter_column_mapping.get(filter_name)
#             if filter_column:
#                 filter_conditions.append(filter_column >= 50)

#         # Apply the filter conditions as an OR condition
#         if filter_conditions:
#             filtered_query = base_query.filter(db.and_(*filter_conditions))
#         else:
#             filtered_query = base_query

#         # Execute the query and retrieve the matching results
#         matches_data = filtered_query.all()

#         # Serialize the matches data into a JSON format
#         serialized_matches = []
#         for match in matches_data:
#             serialized_match = {
#                 'current_user_id': match.current_user_id,
#                 'candidate_user_id': match.candidate_user_id,
#                 'face_match_percent': match.face_match_percent,
#                 'music_match_percent': match.songs_match_percent,
#                 'reels_match_percent': match.reels_match_percent,
#                 'decision': match.decision
#             }
#             serialized_matches.append(serialized_match)

#         return jsonify({'matches': serialized_matches}), 200

#     except Exception as e:
#         print(e)
#         return jsonify({'error': 'An error occurred while fetching matches'}), 500


@match_bp.route('/match-fetch', methods=['GET'])
def match_fetch():
    try:
        # Get the current user's ID using Flask-Login's current_user
        current_user_id = current_user.id

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
        dir(verified_matches)
        # Serialize the filtered matches into a JSON format
        serialized_matches = []
        for match in verified_matches:
            serialized_match = {
                'current_user_id': match.current_user_id,
                'candidate_user_id': match.candidate_user_id,
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
            if getattr(match, column_name, 0) < 50:
                valid = False
                break

        if valid:
            valid_matches.append(match)

    return valid_matches
