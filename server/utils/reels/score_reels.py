# # Import necessary libraries and modules
# from utils.db.db_models import users
# from utils.db.database import db


# def score_reels(user_id, candidate_ids):
#     # Fetch the liked reels of the user
#     user = users.query.get(user_id)
#     user_liked_reels = set(reel['url'] for reel in user.liked_reels)


#     # Initialize a dictionary to store match scores for each candidate
#     match_scores = {}

#     # Iterate through candidate IDs
#     for candidate_id in candidate_ids:
#         try:
#             # Fetch the liked reels of the candidate
#             candidate = users.query.get(candidate_id)
#             candidate_liked_reels = set(reel['url'] for reel in candidate.liked_reels)
#             print('candidate_liked_reels:')
#             print(candidate_liked_reels)

#             # Calculate the match score based on common liked reels
#             common_reels = user_liked_reels.intersection(candidate_liked_reels)
#             match_score = len(common_reels) / len(user_liked_reels) * 100

#             # Store the match score for the candidate
#             match_scores[candidate_id] = match_score
#             print('match_score:')
#             print(match_score)
#         except Exception as e:
#             print(f"Error scoring reels for user {user_id}: {str(e)}")
#             match_scores[candidate_id] = 0

#     return list(match_scores.values())

# if __name__ == '__main__':
#     # Example usage for testing
#     user_id = 35
#     candidate_ids = [37, 36]
#     scores = score_reels(user_id, candidate_ids)
#     print(scores)


from utils.db.database import driver


def score_reels(user_id, candidate_ids):
    print('score_reels!')
    print(f'user_id: {user_id}, candidate_ids: {candidate_ids}')
    match_scores = {}
    with driver.session() as session:
        for candidate_id in candidate_ids:
            match_scores[candidate_id] = 0
            try:
                print(f'candidate_id: {candidate_id}')
                query = (
                    f"MATCH (user:User {{id: '{user_id}'}})-[:LIKES]->(reel:Reel)<-[:LIKES]-(candidate:User {{id: '{candidate_id}'}}) RETURN COUNT(reel) AS commonReels, user, candidate"
                )
                result = session.run(query, user_id=str(user_id), candidate_id=str(candidate_id))
                print(f'result: {result}')
                for record in result:
                    print(f'record: {record}')
                    common_reels = record["commonReels"]
                    print(f'common_reels: {common_reels}')
                    user_liked_count = record["user"]["Reels_count"]
                    match_score = (common_reels / user_liked_count) * 100
                    match_scores[candidate_id] = match_score
            except Exception as e:
                print(f"Error scoring reels for user {user_id}: {str(e)}")
    return list(match_scores.values())

if __name__ == '__main__':
    user_id = 35
    candidate_ids = [37, 36]
    scores = score_reels(user_id, candidate_ids)
    print(scores)
