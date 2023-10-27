import os
import joblib
from face_recognition import face_encodings, load_image_file
import json



# Get the directory where the current script is located
script_directory = os.path.dirname(os.path.abspath(__file__))
# Change the working directory to the script's directory
os.chdir(script_directory)
# Now the working directory for this script is its own directory



# Function to load the trained model from a local file
def load_trained_model(user_id):
    file_path = os.path.join(
        '../../storage', str(user_id), 'face_classifier_model.joblib')
    print('file_path:')
    print(file_path)
    return joblib.load(file_path)

# Function to get predicted probability for a new face
def get_predicted_probability(face_vector, classifier):
    # Get probability of class 1 (interested)
    probability = classifier.predict_proba([face_vector])[0][1]
    return probability

# Function to classify new faces and return scores
def score_face(user_id, candidate_ids):
    classifier = load_trained_model(user_id)

    match_scores = {}

    for candidate_id in candidate_ids:
        try:
            # Fetch the appropriate image by candidate ID from the 'storage' folder
            image_path = os.path.join(
                '../../storage', str(candidate_id), 'profilePic.png')
            face_image = load_image_file(image_path)
            face_vector = face_encodings(face_image)[0]

            # Get predicted probability for interest
            probability = get_predicted_probability(face_vector, classifier)

            # Convert probability to a score between 0 and 100
            score = int(probability * 100)

            # Store the match score for the candidate
            match_scores[candidate_id] = score
        
        except Exception as e:
            print(f"Error scoring face for user {user_id}: {str(e)}")
            score = 0
            match_scores[candidate_id] = score

        print(
            f"Predicted Interest Score for candidate {candidate_id}: {score}")

    return list(match_scores.values())

def main():
    # Modify this part to receive user_id and candidate_ids
    user_id = 1  # Replace with the actual user ID
    candidate_ids = [2, 3, 4]  # Replace with the actual list of candidate IDs

    scores = score_face(user_id, candidate_ids)

    # Write the scores to a JSON file

    # Sort scores in descending order
    scores.sort(reverse=True)

    # Save the scores to a JSON file
    json_filename = "high_score_faces.json"
    with open(json_filename, 'w') as json_file:
        json.dump({"scores": scores}, json_file)

if __name__ == "__main__":
    main()
