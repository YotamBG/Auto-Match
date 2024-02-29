from flask import Blueprint, jsonify
from utils.face.score_face import score_face
from utils.songs.score_songs import score_songs
from utils.reels.score_reels import score_reels
from flask_login import current_user, login_required
from utils.db.database import driver


match_bp = Blueprint('match', __name__)


@match_bp.route('/match-search', methods=['POST'])
@login_required
def match_search(id=None):
    # Retrieve the current user's ID
    if id:
        user_id = id
    else:
        user_id = current_user.id

    try:
        # Delete existing matches for the current user
        with driver.session() as session:
            session.run(
                f"MATCH (:User {{id: '{user_id}'}})-[r:MATCH]->(:User) DELETE r"
            )

        # Retrieve the current user's location and filter weights
        with driver.session() as session:
            result = session.run(
                f"""MATCH (u:User {{id: '{user_id}'}}) RETURN u.face_filter_weight AS face_weight, "
                u.songs_filter_weight AS songs_weight, u.reels_filter_weight AS reels_weight, 
                u.location AS location"""
            )
            user_data = result.single()
            face_weight = user_data['face_weight']
            songs_weight = user_data['songs_weight']
            reels_weight = user_data['reels_weight']
            current_user_location = user_data['location']

        # Retrieve candidate users in the same location
        with driver.session() as session:
            result = session.run(
                f"MATCH (u:User) WHERE NOT u.id = '{user_id}' AND u.location = '{current_user_location}' RETURN u"
            )
            candidates = [record['u'] for record in result]
            print(f'len(candidates): {len(candidates)}')

        # Initialize a list to store the analyzed matches
        analyzed_matches = []

        # Get candidate IDs
        candidate_ids = [candidate['id'] for candidate in candidates]

        # Score songs matches
        songs_match_scores = score_songs(user_id, candidate_ids)
        print(songs_match_scores)

        # Score reels matches
        reels_match_scores = score_reels(user_id, candidate_ids)
        print(reels_match_scores)

        # Score face matches
        face_match_scores = score_face(user_id, candidate_ids)
        print(face_match_scores)

        total_scores = []

        for i, candidate in enumerate(candidates):
            candidate_id = candidate['id']
            face_match_score = face_match_scores[i]
            songs_match_score = songs_match_scores[i]
            reels_match_score = reels_match_scores[i]

            total_score = (face_match_score * face_weight + 
                           songs_match_score * songs_weight + 
                           reels_match_score * reels_weight)

            total_scores.append(total_score)

            analyzed_matches.append({
                'current_user_id': user_id,
                'candidate_user_id': candidate_id,
                'face_match_percent': face_match_score,
                'reels_match_percent': reels_match_score,
                'songs_match_percent': songs_match_score,
                'total_match_percent': total_score
            })

            # Save the match to the graph database
            with driver.session() as session:
                session.run(
                    f"""
                    MATCH (u1:User {{id: '{user_id}'}}), (u2:User {{id: '{candidate_id}'}})
                    CREATE (u1)-[:MATCH {{face_match_percent: {face_match_score}, 
                                          reels_match_percent: {reels_match_score},
                                          songs_match_percent: {songs_match_score},
                                          total_match_percent: {total_score}}}]->(u2)
                    """
                )

        # Calculate the threshold based on the top 20% of total scores
        total_scores.sort(reverse=True)
        threshold_index = int(0.2 * len(total_scores))
        threshold = total_scores[threshold_index]

        # Update the user's threshold property
        with driver.session() as session:
            session.run(
                f"MATCH (u:User {{id: '{user_id}'}}) SET u.threshold = {threshold}"
            )

        # Return all analyzed matches and the threshold
        return jsonify({
            'message': 'Match search completed successfully',
            'analyzed_matches': analyzed_matches,
            'threshold': threshold
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
        print(f'current_user_id = {current_user_id}!!!!')

        # Cypher Query for Match Fetching and Calculation
        match_fetch_query = f"""
        MATCH (u:User {{id: '{current_user_id}'}})-[um:MATCH]->(c:User)-[cm:MATCH]->(u)
        WHERE (toFloat(um.face_match_percent) * u.face_filter_weight) +
              (toFloat(um.songs_match_percent) * u.songs_filter_weight) +
              (toFloat(um.reels_match_percent) * u.reels_filter_weight) >= u.threshold
          AND (toFloat(cm.face_match_percent) * c.face_filter_weight) +
              (toFloat(cm.songs_match_percent) * c.songs_filter_weight) +
              (toFloat(cm.reels_match_percent) * c.reels_filter_weight) >= c.threshold
        RETURN c.id AS candidate_user_id, c.name AS candidate_user_name,
               toFloat(um.face_match_percent) AS face_match_percent,
               toFloat(um.songs_match_percent) AS songs_match_percent,
               toFloat(um.reels_match_percent) AS reels_match_percent,
               ((toFloat(um.face_match_percent) * u.face_filter_weight) +
               (toFloat(um.songs_match_percent) * u.songs_filter_weight) +
               (toFloat(um.reels_match_percent) * u.reels_filter_weight)) AS total_score
        """
         
        # Fetch matches from Neo4j
        with driver.session() as session:
            result = session.run(match_fetch_query)
            
            matches = []
            for record in result:
                match = {
                    'current_user_id': current_user_id,
                    'candidate_user_id': int(record['candidate_user_id']),
                    'candidate_user_name': record['candidate_user_name'],
                    'face_match_percent': float(record['face_match_percent']),
                    'songs_match_percent': float(record['songs_match_percent']),
                    'reels_match_percent': float(record['reels_match_percent']),
                    'total_score': float(record['total_score'])
                }
                print(match)
                matches.append(match)

        return jsonify({'matches': matches}), 200

        
    except Exception as e:
        print(e)
        return jsonify({'error': 'An error occurred while fetching matches'}), 500



@match_bp.route('/match-fetch-all', methods=['GET'])
def match_fetch_all():
    print('hello')
    try:
        # Get the current user's ID using Flask-Login's current_user
        current_user_id = current_user.id
        print(f"Current User ID: {current_user_id}")

        
        # Fetch matches from Neo4j
        with driver.session() as session:
            result = session.run(f"""
        MATCH (u:User {{id: '{current_user_id}'}})-[m:MATCH]->(c:User)
        RETURN c.id AS candidate_user_id, c.name AS candidate_user_name,
               m.face_match_percent AS face_match_percent,
               m.songs_match_percent AS songs_match_percent,
               m.reels_match_percent AS reels_match_percent,
               ((toFloat(m.face_match_percent) * u.face_filter_weight) +
               (toFloat(m.songs_match_percent) * u.songs_filter_weight) +
               (toFloat(m.reels_match_percent) * u.reels_filter_weight)) AS total_score
        """)
            matches = []
            for record in result:
                match = {
                    'current_user_id': current_user_id,
                    'candidate_user_id': int(record['candidate_user_id']),
                    'candidate_user_name': record['candidate_user_name'],
                    'face_match_percent': float(record['face_match_percent']),
                    'songs_match_percent': float(record['songs_match_percent']),
                    'reels_match_percent': float(record['reels_match_percent']),
                    'total_score': float(record['total_score'])
                }
                print(match)
                matches.append(match)

        return jsonify({'matches': matches}), 200

        
    except Exception as e:
        print(e)
        return jsonify({'error': 'An error occurred while fetching matches'}), 500


@match_bp.route('/match-search-all', methods=['POST'])
@login_required
def match_search_all(id=None):
    # Retrieve the current user's ID
    if id:
        user_id = id
    else:
        user_id = current_user.id

    try:
        # Delete existing matches for the current user
        with driver.session() as session:
            session.run(
                f"MATCH (:User {{id: '{user_id}'}})-[r:MATCH]->(:User) DELETE r"
            )

        # Retrieve the current user's location and filter weights
        with driver.session() as session:
            result = session.run(
                f"""MATCH (u:User {{id: '{user_id}'}}) RETURN u.face_filter_weight AS face_weight, 
                u.songs_filter_weight AS songs_weight, u.reels_filter_weight AS reels_weight"""
            )
            user_data = result.single()
            face_weight = user_data['face_weight']
            songs_weight = user_data['songs_weight']
            reels_weight = user_data['reels_weight']

        # Retrieve candidate users in the same location
        with driver.session() as session:
            result = session.run(
                f"MATCH (u:User) WHERE NOT u.id = '{user_id}' RETURN u"
            )
            candidates = [record['u'] for record in result]
            print(f'len(candidates): {len(candidates)}')

        # Initialize a list to store the analyzed matches
        analyzed_matches = []

        # Get candidate IDs
        candidate_ids = [candidate['id'] for candidate in candidates]

        # Score songs matches
        songs_match_scores = score_songs(user_id, candidate_ids)
        print(songs_match_scores)

        # Score reels matches
        reels_match_scores = score_reels(user_id, candidate_ids)
        print(reels_match_scores)

        # Score face matches
        face_match_scores = score_face(user_id, candidate_ids)
        print(face_match_scores)

        total_scores = []

        for i, candidate in enumerate(candidates):
            candidate_id = candidate['id']
            face_match_score = face_match_scores[i] or 0
            songs_match_score = songs_match_scores[i] or 0
            reels_match_score = reels_match_scores[i] or 0

            total_score = (face_match_score * face_weight + 
                           songs_match_score * songs_weight + 
                           reels_match_score * reels_weight)

            total_scores.append(total_score)

            analyzed_matches.append({
                'current_user_id': user_id,
                'candidate_user_id': candidate_id,
                'face_match_percent': face_match_score,
                'reels_match_percent': reels_match_score,
                'songs_match_percent': songs_match_score,
                'total_match_percent': total_score
            })

            # Save the match to the graph database
            with driver.session() as session:
                session.run(
                    f"""
                    MATCH (u1:User {{id: '{user_id}'}}), (u2:User {{id: '{candidate_id}'}})
                    CREATE (u1)-[:MATCH {{face_match_percent: {face_match_score}, 
                                          reels_match_percent: {reels_match_score},
                                          songs_match_percent: {songs_match_score},
                                          total_match_percent: {total_score}}}]->(u2)
                    """
                )

        # Calculate the threshold based on the top 20% of total scores
        total_scores.sort(reverse=True)
        threshold_index = int(0.2 * len(total_scores))
        threshold = total_scores[threshold_index]

        # Update the user's threshold property
        with driver.session() as session:
            session.run(
                f"MATCH (u:User {{id: '{user_id}'}}) SET u.threshold = {threshold}"
            )

        # Return all analyzed matches and the threshold
        return jsonify({
            'message': 'Match search completed successfully',
            'analyzed_matches': analyzed_matches,
            'threshold': threshold
        }), 200

    except Exception as e:
        print('error:')
        print(e)
        return jsonify({'error': str(e)}), 500



def update_relationship_count(user_id, relationship_type, node_label):
    with driver.session() as session:
        # Count the number of relationships of the specified type
        print('ok1')

        count_query = (
            f"MATCH (user:User {{id: '{user_id}'}})-[:{relationship_type}]->(node:{node_label}) RETURN COUNT(*) AS count"
        )
        print('ok2')
        print("Count query:", count_query)
        
        # Execute the count query
        result = session.run(count_query)
        count = result.single().get("count", 0)
        print("Count:", count)

        # Update the user node with the count
        update_query = (
            f"MATCH (user:User {{id: '{user_id}'}}) SET user.{node_label}s_count = {count}"
        )
        print("Update query:", update_query)

        # Execute the update query
        session.run(update_query)
        print(f"user.{node_label}s_count updated for user {user_id}!")



@match_bp.route('/match-search-all-all', methods=['POST'])
def match_search_all_all():
    try:
        # Retrieve all users
        with driver.session() as session:
           result = session.run(
               "MATCH (u:User) RETURN u",
           )
           all_users = [record['u'] for record in result]
           print(f'len(all_users): {len(all_users)}')
        

        for user in all_users:
            match_search_all(user['id'])


    except Exception as e:
        print('error:')
        print(e)
        return jsonify({'error': str(e)}), 500

    # Return all analyzed matches
    return jsonify({
        'message': 'Match search completed successfully',
    }), 200


@match_bp.route('/get-match/<int:current_user_id>/<int:candidate_user_id>', methods=['GET'])
def get_match(current_user_id, candidate_user_id):
    try:
        with driver.session() as session:
            # Search for the match based on current_user_id and candidate_user_id
            result = session.run(
                f"""MATCH (u:User {{id: '{current_user_id}'}})-[m:MATCH]->(c:User {{id: '{candidate_user_id}'}}) 
                RETURN m.face_match_percent AS face_match_percent, 
                m.reels_match_percent AS reels_match_percent, 
                m.songs_match_percent AS songs_match_percent, 
                m.total_match_percent AS total_match_percent"""
            )
            record = result.single()
            if record is None:
                return jsonify({'error': 'Match not found'}), 404

            # Retrieve common reels and songs
            common_reels_query = (
                f"""MATCH (cu:User {{id: '{current_user_id}'}})-[r:LIKES]->(reel:Reel)<-[r2:LIKES]-(cu2:User {{id: '{candidate_user_id}'}}) 
                RETURN DISTINCT reel.link AS link"""
            )
            common_songs_query = (
                f"""MATCH (cu:User {{id: '{current_user_id}'}})-[s:LIKES]->(song:Song)<-[s2:LIKES]-(cu2:User {{id: '{candidate_user_id}'}}) 
                RETURN DISTINCT song.id AS id"""
            )

            common_reels = [record['link'] for record in session.run(common_reels_query)]
            common_songs = [record['id'] for record in session.run(common_songs_query)]

            match_data = {
                'current_user_id': current_user_id,
                'candidate_user_id': candidate_user_id,
                'face_match_percent': record["face_match_percent"],
                'reels_match_percent': record["reels_match_percent"],
                'songs_match_percent': record["songs_match_percent"],
                'total_match_percent': record["total_match_percent"],
                'common_reels': common_reels,
                'common_songs': common_songs
            }

            return jsonify(match_data)

    except Exception as e:
        return jsonify({'error': str(e)}), 500