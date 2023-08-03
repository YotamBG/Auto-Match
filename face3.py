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
import time

def fetch_custom_face(url):
    try:
        response = requests.get(url)
        response.raise_for_status()
    except requests.exceptions.RequestException as e:
        print(f"Error fetching the image: {e}")
        return None

    try:
        image = Image.open(BytesIO(response.content))
        return np.array(image)  # Convert image to NumPy array
    except Exception as e:
        print(f"Error processing the image: {e}")
        return None

# def fetch_fake_faces(count, gender, age, ethnicity):
#     base_url = "https://this-person-does-not-exist.com/new"
#     images = []

#     for i in range(count):
#         current_time_ms = int(time.time() * 1000)  # Get the current Unix time in milliseconds
#         params = {
#             "time": current_time_ms,
#             "gender": gender,
#             "age": age,
#             "etnic": ethnicity
#         }
#         try:
#             response = requests.get(base_url, params=params)
#             response.raise_for_status()
#         except requests.exceptions.RequestException as e:
#             print(f"Error fetching the image: {e}")
#             continue

#         try:
#             # Extract the picture ID from the response URL
#             picture_id = eval(response.content)['name']
#             print(picture_id)
#             image_url = f"https://this-person-does-not-exist.com/img/{picture_id}"
#             print(image_url)

#             # Fetch the custom face using the picture ID
#             custom_face = fetch_custom_face(image_url)
#             if custom_face is not None:
#                 images.append(custom_face)
#                 print(f"Fetched image {i + 1}/{count}")
#         except Exception as e:
#             print(f"Error processing the image: {e}")
#             continue
    
#     # Provide the unsorted_folder argument to save_unsorted_faces function
#     unsorted_folder = f"unsorted_faces/unsorted_faces_{gender}_{ethnicity}"
#     save_unsorted_faces(images, unsorted_folder)

#     return images


# ... (previous code)

def fetch_fake_faces(count, gender, age, ethnicity):
    base_url = "https://this-person-does-not-exist.com/new"
    images = []
    previous_ids = set()
    max_retries = 5

    for i in range(count):
        current_time_ms = int(time.time() * 1000)  # Get the current Unix time in milliseconds
        params = {
            "time": current_time_ms,
            "gender": gender,
            "age": age,
            "etnic": ethnicity
        }
        retries = 0
        while retries < max_retries:
            try:
                response = requests.get(base_url, params=params)
                response.raise_for_status()
            except requests.exceptions.RequestException as e:
                print(f"Error fetching the image: {e}")
                continue

            try:
                # Extract the picture ID from the response URL
                picture_id = eval(response.content)['name']
                if picture_id in previous_ids:
                    print(f"Skipping duplicate image {i + 1}/{count}")
                    print(f"https://this-person-does-not-exist.com/img/{picture_id}")
                    retries += 1
                    if retries % 6 == 0:
                        print(f"Sleeping for {retries} seconds...")
                        time.sleep(retries)
                    continue

                print(picture_id)
                image_url = f"https://this-person-does-not-exist.com/img/{picture_id}"
                print(image_url)

                # Fetch the custom face using the picture ID
                custom_face = fetch_custom_face(image_url)
                if custom_face is not None:
                    images.append(custom_face)
                    previous_ids.add(picture_id)
                    print(f"Fetched image {i + 1}/{count}")
                    break  # Exit the retry loop if a new face is fetched successfully
            except Exception as e:
                print(f"Error processing the image: {e}")
            
            retries += 1

    # Provide the unsorted_folder argument to save_unsorted_faces function
    unsorted_folder = f"unsorted_faces/unsorted_faces_{gender}_{ethnicity}"
    save_unsorted_faces(images, unsorted_folder)

    return images

# ... (rest of the code)


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


def save_unsorted_faces(images, unsorted_folder):
    for i, image in enumerate(images):
        filename = f"face_{i}.jpg"
        save_image(image, unsorted_folder, filename)


def cluster_faces(unsorted_directory, num_clusters, start_cluster):
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
        cluster_name = f"cluster_{cluster_label+start_cluster}"
        encodings_dict[cluster_name] = average_encoding.tolist()

        for index in cluster_indices:
            if index < len(images):
                save_image(images[index], f"sorted faces/{cluster_name}", f"face_{index}.jpg")
                print(f"Image face_{index}.jpg added to {cluster_name}")

    # Save the encodings dictionary as JSON
    save_encodings(encodings_dict)
    print("Clustering complete.")

def save_encodings(encodings_dict):
    filepath = "sorted faces/encodings.json"

    if not os.path.exists(filepath):
        print("Encodings file not found. Creating an empty dictionary...")
        with open(filepath, "w") as json_file:
            json.dump({}, json_file)

    with open(filepath, "r") as json_file:
        existing_encodings_dict = json.load(json_file)

    # Combine the existing encodings with the new ones
    updated_encodings_dict = {**existing_encodings_dict, **encodings_dict}

    print("Saving encodings to 'encodings.json'...")
    with open(filepath, "w") as json_file:
        json.dump(updated_encodings_dict, json_file)
    print("Encodings saved.")


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
    genders = ['male', 'female']
    ages = ['26-35']
    # ethnicities = ['asian', 'black', 'white', 'indian', 'middle_eastern', 'latino_hispanic']
    ethnicities = ['black', 'asian']

    i = 26
    num_clusters=13
    face_count=150
    for ethnicity in ethnicities:
        for gender in genders:
            images = fetch_fake_faces(count=face_count, gender=gender, age=ages[0], ethnicity=ethnicity)
            unsorted_folder = f"unsorted_faces/unsorted_faces_{gender}_{ethnicity}"
            save_unsorted_faces(unsorted_folder=unsorted_folder, images=images)
            cluster_faces(unsorted_directory=unsorted_folder, num_clusters=num_clusters, start_cluster=i)
            i+=num_clusters

    sort_new_face(new_face_path="./yotam.jpeg")


if __name__ == "__main__":
    main()