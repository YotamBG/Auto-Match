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

# Function to load and encode faces from the provided folder
def load_faces_from_folder(folder_path, images_names, label, labels):
    face_encodings_list = [] 

    for image_name in images_names:
        image_path = os.path.join(folder_path, image_name)
        face_image = load_image_file(image_path)
        face_encoding = face_encodings(face_image)[0]
        face_encodings_list.append(face_encoding) 
        labels.append(label)
    
    return face_encodings_list  # Return the list with the face encodings

# Function to train the model
def train_model(yes_faces_names, no_faces_names):
    labels = []  # List to store the labels (interest: 1 for yes, 0 for no)
    face_vectors = []  # List to store the face encodings

    # Load and encode faces from the "yes-faces" folder
    face_vectors.extend(load_faces_from_folder('faces', yes_faces_names, 1, labels))

    # Load and encode faces from the "no-faces" folder
    face_vectors.extend(load_faces_from_folder('faces', no_faces_names, 0, labels))

    # Split data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(face_vectors, labels, test_size=0.2, random_state=42)

    # Create a Random Forest Classifier
    classifier = RandomForestClassifier(n_estimators=100, random_state=42)

    # Train the model
    classifier.fit(X_train, y_train)

    # Save the trained model to a local file
    model_filename = "face_classifier_model.joblib"
    joblib.dump(classifier, model_filename)

    # Evaluate the model
    accuracy = classifier.score(X_test, y_test)
    print("Model Accuracy:", accuracy)

# Function to load the trained model from a local file
def load_trained_model(model_filename):
    return joblib.load(model_filename)

# Function to get predicted probability for a new face
def get_predicted_probability(face_vector, classifier):
    probability = classifier.predict_proba([face_vector])[0][1]  # Get probability of class 1 (interested)
    return probability


def plot_decision_tree(feature_names=None, class_names=None):
    model_filename = "face_classifier_model.joblib"
    classifier = load_trained_model(model_filename)
    plt.figure(figsize=(12, 8))
    plot_tree(classifier.estimators_[0], filled=True, feature_names=feature_names, class_names=class_names)
    plt.show()


# Main script for classifying new faces
def classify_new_faces(new_faces_folder):
    model_filename = "face_classifier_model.joblib"
    classifier = load_trained_model(model_filename)
    high_score_faces = []

    for filename in os.listdir(new_faces_folder):
        image_path = os.path.join(new_faces_folder, filename)
        face_image = load_image_file(image_path)
        face_vector = face_encodings(face_image)[0]

        # Get predicted probability for interest
        probability = get_predicted_probability(face_vector, classifier)

        # Convert probability to a score between 0 and 100
        score = int(probability * 100)

        if score > 80:
            high_score_faces.append(filename)

        print(f"Predicted Interest Score for {filename}: {score}")
    
    
    # Write high-score filenames to a JSON file
    json_filename = "high_score_faces.json"
    with open(json_filename, 'w') as json_file:
        json.dump({"faces": high_score_faces}, json_file)





def main():

    # Load JSON data from a file
    with open('face_lists.json', 'r') as json_file:
        data = json.load(json_file)

    liked_faces = data['liked_faces']
    noped_faces = data['noped_faces']
    print("liked_faces:", liked_faces)
    print("noped_faces:", noped_faces)

    
    train_model(yes_faces_names=liked_faces, no_faces_names=noped_faces)
    classify_new_faces(new_faces_folder="out-of-sample faces")
    # plot_decision_tree(feature_names=None, class_names=["Not Interested", "Interested"])

    # liked_faces: ['face_1.jpg', 'face_2.jpg']
    # noped_faces: ['face_3.jpg', 'face_4.jpg']


if __name__ == "__main__":
    main()