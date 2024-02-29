# # Import necessary libraries and modules
# from utils.db.db_models import users
# from utils.db.database import db


# def score_songs(user_id, candidate_ids):
#     # Fetch the liked songs of the user
#     user = users.query.get(user_id)
#     # user_liked_songs = set(user.liked_songs)
#     user_liked_songs = set(song['artist'] for song in user.liked_songs)

#     # Initialize a dictionary to store match scores for each candidate
#     match_scores = {}

#     # Iterate through candidate IDs
#     for candidate_id in candidate_ids:
#         try:
#             # Fetch the liked songs of the candidate
#             candidate = users.query.get(candidate_id)
#             # candidate_liked_songs = set(candidate.liked_songs)
#             candidate_liked_songs = set(song['artist'] for song in candidate.liked_songs)


#             # Calculate the match score based on common liked songs
#             common_songs = user_liked_songs.intersection(candidate_liked_songs)
#             match_score = len(common_songs) / len(user_liked_songs) * 100

#             # Store the match score for the candidate
#             match_scores[candidate_id] = match_score
#         except Exception as e:
#             print(f"Error scoring songs for user {user_id}: {str(e)}")
#             match_scores[candidate_id] = 0

#     return list(match_scores.values())

# if __name__ == '__main__':
#     # Example usage for testing
#     user_id = 35
#     candidate_ids = [37, 36]
#     scores = score_songs(user_id, candidate_ids)
#     print(scores)


from utils.db.database import driver

def score_songs(user_id, candidate_ids):
    print('score_songs!')
    print(f'user_id: {user_id}, candidate_ids: {candidate_ids}')
    match_scores = {}
    with driver.session() as session:
        for candidate_id in candidate_ids:
            match_scores[candidate_id] = 0
            try:
                print(f'candidate_id: {candidate_id}')
                # Fetch the liked songs of the user
                query = (
                    f"MATCH (user:User {{id: '{user_id}'}})-[:LIKES]->(song:Song)<-[:LIKES]-(candidate:User {{id: '{candidate_id}'}}) RETURN COUNT(song) AS commonSongs, user, candidate"
                )
                result = session.run(query)
                print(f'result: {result}')
                for record in result:
                    print(f'record: {record}')
                    common_songs = record["commonSongs"]
                    user_liked_count = record["user"]["Songs_count"]
                    print(f'record["user"]: {record["user"]}')
                    print(f'common_songs: {common_songs}, user_liked_count: {user_liked_count}')
                    match_score = (common_songs / user_liked_count) * 100
                    match_scores[candidate_id] = match_score
            except Exception as e:
                print(f"Error scoring songs for user {user_id}: {str(e)}")
    return list(match_scores.values())

if __name__ == '__main__':
    user_id = 35
    candidate_ids = [37, 36]
    scores = score_songs(user_id, candidate_ids)
    print(scores)