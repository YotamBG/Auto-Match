import ast
import json
import os
import sys
import numpy as np
import joblib
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from face_recognition import face_encodings, load_image_file
import matplotlib.pyplot as plt
from sklearn.tree import plot_tree

# Get the directory where the current script is located
script_directory = os.path.dirname(os.path.abspath(__file__))
# Change the working directory to the script's directory
os.chdir(script_directory)
# Now the working directory for this script is its own directory


# Function to load and encode faces from the provided folder
def load_faces_from_folder(folder_path, images_names, label, labels):
    face_encodings_list = [] 


    # use these lines to load pics from URL
    # response = urllib.request.urlopen(url)
    # image = face_recognition.load_image_file(response)

    print(f'images_names: ${images_names}')
    for image_name in images_names:
        image_path = os.path.join(folder_path, image_name)
        face_image = load_image_file(image_path)
        face_encoding = face_encodings(face_image)[0]
        face_encodings_list.append(face_encoding) 
        labels.append(label)
    
    return face_encodings_list  # Return the list with the face encodings

# Function to load the trained model from a local file
def load_trained_model(model_filename):
    return joblib.load(model_filename)

# Function to get predicted probability for a new face
def get_predicted_probability(face_vector, classifier):
    probability = classifier.predict_proba([face_vector])[0][1]  # Get probability of class 1 (interested)
    return probability

# Main script for classifying new faces
def classify_new_faces(new_faces_folder):
    model_filename = "face_classifier_model.joblib"
    classifier = load_trained_model(model_filename)
    scores = []

    
    # convert to proper param
    max_checks = 30
    checks = 0
    for filename in os.listdir(new_faces_folder):
        if(max_checks < checks):
            break
        image_path = os.path.join(new_faces_folder, filename)
        face_image = load_image_file(image_path)
        face_vector = face_encodings(face_image)[0]

        # Get predicted probability for interest
        probability = get_predicted_probability(face_vector, classifier)

        # Convert probability to a score between 0 and 100
        score = int(probability * 100)

        scores.append((filename, score))

        print(f"Predicted Interest Score for {filename}: {score}")
        checks+=1
    
    
    # Write high-score filenames to a JSON file

    # Sort scores in descending order of score
    scores.sort(key=lambda x: x[1], reverse=True)
    
    # Save the highest quarter filenames to a JSON file
    json_filename = "high_score_faces.json"
    quarter_length = len(scores) // 10
    high_score_faces = [filename for filename, _ in scores[:quarter_length]]
    with open(json_filename, 'w') as json_file:
        json.dump({"faces": high_score_faces}, json_file)




def main():

    # Load JSON data from a file
    with open('face_lists.json', 'r') as json_file:
        data = json.load(json_file)

    liked_faces = data['likedFaces']
    noped_faces = data['nopedFaces']
    print("liked_faces:", liked_faces)
    print("noped_faces:", noped_faces)

    
    # train_model(yes_faces_names=liked_faces, no_faces_names=noped_faces)
    classify_new_faces(new_faces_folder="candidate-faces")
    # plot_decision_tree(feature_names=None, class_names=["Not Interested", "Interested"])

    # liked_faces: ['face_1.jpg', 'face_2.jpg']
    # noped_faces: ['face_3.jpg', 'face_4.jpg']


if __name__ == "__main__":
    main()