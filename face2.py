import os
import requests
from PIL import Image
from io import BytesIO
import face_recognition
import numpy as np
from sklearn.cluster import KMeans
import json
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
import re
from sklearn.cluster import MeanShift, estimate_bandwidth
from sklearn.cluster import AgglomerativeClustering
from sklearn.metrics import pairwise_distances



def fetch_fake_faces(count):
    url = "https://thispersondoesnotexist.com/"
    images = []

    for i in range(count):
        try:
            response = requests.get(url)
            response.raise_for_status()
        except requests.exceptions.RequestException as e:
            print(f"Error fetching the image: {e}")
            continue

        try:
            image = Image.open(BytesIO(response.content))
            images.append(np.array(image))  # Convert image to NumPy array
            print(f"fetched img num {i}")
        except Exception as e:
            print(f"Error processing the image: {e}")
            continue

    save_unsorted_faces(images)

    return images

def save_image(image_array, directory, filename):
    if not os.path.exists(directory):
        os.makedirs(directory)

    image = Image.fromarray(np.uint8(image_array))  # Convert NumPy array back to PIL Image
    filepath = os.path.join(directory, filename)

    try:
        image.save(filepath)
        # print(f"Image saved as {filepath}")
    except Exception as e:
        print(f"Error saving the image: {e}")

def save_unsorted_faces(images):
    for i, image in enumerate(images):
        filename = f"face_{i}.jpg"
        save_image(image, "unsorted faces", filename)




def cluster_faces(unsorted_directory, num_clusters):
    images = []
    for filename in os.listdir(unsorted_directory):
        filepath = os.path.join(unsorted_directory, filename)
        try:
            image = Image.open(filepath)
            images.append(np.array(image))
        except Exception as e:
            print(f"Error processing the image {filename}: {e}")

    print("Clustering faces using K-Means...")

    face_encodings = [face_recognition.face_encodings(image)[0] for image in images]

    kmeans = KMeans(n_clusters=num_clusters, random_state=42)
    cluster_labels = kmeans.fit_predict(face_encodings)

    encodings_dict = {}
    for cluster_label in set(cluster_labels):
        print(f"Processing cluster {cluster_label}...")
        cluster_indices = np.where(cluster_labels == cluster_label)[0]
        cluster_encodings = [face_encodings[i] for i in cluster_indices]
        average_encoding = np.mean(cluster_encodings, axis=0)
        cluster_name = f"cluster_{cluster_label}"
        encodings_dict[cluster_name] = average_encoding.tolist()

        for index in cluster_indices:
            if index < len(images):
                save_image(images[index], f"sorted faces/{cluster_name}", f"face_{index}.jpg")
                print(f"Image face_{index}.jpg added to {cluster_name}")

    # Save the encodings dictionary as JSON
    with open("sorted faces/encodings.json", "w") as json_file:
        json.dump(encodings_dict, json_file)

    print("Clustering complete.")




def load_encodings():
    print("Loading encodings from 'encodings.json'...")
    with open("sorted faces/encodings.json", "r") as json_file:
        encodings_dict = json.load(json_file)
    print("Encodings loaded.")
    return {label: np.array(enc) for label, enc in encodings_dict.items()}

def sort_new_face(new_face_path):
    print("Sorting the new image into a cluster...")
    encodings_dict = load_encodings()

    # Load the new image and extract its face encodings
    new_face = face_recognition.load_image_file(new_face_path)
    new_face_encoding = face_recognition.face_encodings(new_face)[0]

    # Find the nearest cluster based on similarity (using Euclidean distance)
    nearest_cluster_label = None
    min_distance = float('inf')
    for cluster_label, cluster_encoding in encodings_dict.items():
        distance = np.linalg.norm(new_face_encoding - np.array(cluster_encoding))
        if distance < min_distance:
            min_distance = distance
            nearest_cluster_label = cluster_label

    if nearest_cluster_label is not None:
        # Save the new image in the nearest cluster's directory
        save_image(new_face, f"sorted faces/{nearest_cluster_label}", "new_face.jpg")
        print(f"New image 'new_face.jpg' added to cluster {nearest_cluster_label}")
    else:
        print("Unable to find a suitable cluster for the new image. It might be an outlier.")



def main():
    
    # fetch_fake_faces(count=500)

    # cluster_faces(unsorted_directory="faces", num_clusters=30)

    sort_new_face(new_face_path="./yotam.jpeg")

if __name__ == "__main__":
    main()
