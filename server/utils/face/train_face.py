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

# Function to create a user-specific folder in the storage directory
def create_user_folder(user_id):
    user_folder = os.path.join('../../storage', str(user_id))
    os.makedirs(user_folder, exist_ok=True)
    return user_folder

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
def train_face(user_id, yes_faces_names, no_faces_names):
    labels = []  # List to store the labels (interest: 1 for yes, 0 for no)
    face_vectors = []  # List to store the face encodings

    # Load and encode faces from the "yes-faces" folder
    face_vectors.extend(load_faces_from_folder('catalog-faces', yes_faces_names, 1, labels))

    # Load and encode faces from the "no-faces" folder
    face_vectors.extend(load_faces_from_folder('catalog-faces', no_faces_names, 0, labels))

    # Split data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(face_vectors, labels, test_size=0.2, random_state=42)

    # Create a Random Forest Classifier
    classifier = RandomForestClassifier(n_estimators=50, random_state=42)  # Fine tune this hyperparameter (default n_estimators=100)

    # Train the model
    classifier.fit(X_train, y_train)

    # Create the user-specific folder if it doesn't exist
    user_folder = create_user_folder(user_id)
    print('user_folder:')
    print(user_folder)

    # Save the trained model to the user's folder
    model_filename = os.path.join(user_folder, "face_classifier_model.joblib")
    joblib.dump(classifier, model_filename)

    # Evaluate the model
    accuracy = classifier.score(X_test, y_test)
    print("Model Accuracy:", accuracy)

# def dynamic_train_face(user_id, folder_name, yes_faces_names, no_faces_names):
#     labels = []  # List to store the labels (interest: 1 for yes, 0 for no)
#     face_vectors = []  # List to store the face encodings
#     print('dynamic_train_face!')

#     # Load and encode faces from the "yes-faces" folder
#     face_vectors.extend(load_faces_from_folder(f'new-faces/{folder_name}', yes_faces_names, 1, labels))

#     # Load and encode faces from the "no-faces" folder
#     face_vectors.extend(load_faces_from_folder(f'new-faces/{folder_name}', no_faces_names, 0, labels))

#     # Split data into training and testing sets
#     X_train, X_test, y_train, y_test = train_test_split(face_vectors, labels, test_size=0.2, random_state=42)

#     # Create a Random Forest Classifier
#     classifier = RandomForestClassifier(n_estimators=50, random_state=42)  # Fine tune this hyperparameter (default n_estimators=100)

#     # Train the model
#     classifier.fit(X_train, y_train)

#     # Create the user-specific folder if it doesn't exist
#     user_folder = create_user_folder(user_id)
#     print('user_folder:')
#     print(user_folder)

#     # Save the trained model to the user's folder
#     model_filename = os.path.join(user_folder, "face_classifier_model.joblib")
#     joblib.dump(classifier, model_filename)

#     # Evaluate the model
#     accuracy = classifier.score(X_test, y_test)
#     print("Model Accuracy:", accuracy)
def plot_decision_tree(feature_names=None, class_names=None):
    model_filename = "face_classifier_model.joblib"
    classifier = joblib.load(model_filename)
    plt.figure(figsize=(12, 8))
    plot_tree(classifier.estimators_[0], filled=True, feature_names=feature_names, class_names=class_names)
    plt.show()

# def main():
#     # Load JSON data from a file
#     with open('face_lists.json', 'r') as json_file:
#         data = json.load(json_file)

#     user_id = 1  # Replace with the actual user ID
#     liked_faces = data['likedFaces']
#     disliked_faces = data['dislikedFaces']
#     print("liked_faces:", liked_faces)
#     print("disliked_faces:", disliked_faces)

#     train_face(user_id, yes_faces_names=liked_faces, no_faces_names=disliked_faces)

# if __name__ == "__main__":
#     main()
