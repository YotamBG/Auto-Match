import os
import requests
from PIL import Image
from io import BytesIO
import face_recognition
import numpy as np
from sklearn.cluster import DBSCAN
import json

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

def cluster_faces(unsorted_directory):
    unsorted_images = []
    for filename in os.listdir(unsorted_directory):
        filepath = os.path.join(unsorted_directory, filename)
        try:
            image = Image.open(filepath)
            unsorted_images.append(np.array(image))
        except Exception as e:
            print(f"Error processing the image {filename}: {e}")

    print("Clustering faces...")
    
    face_encodings = [face_recognition.face_encodings(image)[0] for image in unsorted_images]

    # for eps in np.arange(0.1, 1.1, 0.1):
    eps=0.5
    # Ty different values of eps to find the best separation
    print(f"Running DBSCAN with eps={eps}...")
    clustering = DBSCAN(eps=eps, min_samples=2).fit(face_encodings)
    num_clusters = len(set(clustering.labels_))
    print(f"Number of clusters (eps={eps}): {num_clusters}")
    encodings_dict = {}
    print(f'clustering.labels_ {clustering.labels_}')
    for cluster_label in set(clustering.labels_):
        print(f"Processing cluster {cluster_label}...")
        cluster_indices = np.where(clustering.labels_ == cluster_label)[0]
        cluster_encodings = [face_encodings[i] for i in cluster_indices]
        average_encoding = np.mean(cluster_encodings, axis=0)
        cluster_name = f"cluster_{cluster_label}"
        encodings_dict[cluster_name] = average_encoding.tolist()
        for index in cluster_indices:
            if index < len(unsorted_images):
                save_image(unsorted_images[index], f"sorted faces/{cluster_name}", f"face_{index}.jpg")
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

def find_nearest_cluster(new_face_encoding, encodings_dict):
    print("Finding the nearest cluster...")
    min_distance = float('inf')
    nearest_cluster = None
    for cluster_label, cluster_encoding in encodings_dict.items():
        distance = np.linalg.norm(cluster_encoding - new_face_encoding)
        if distance < min_distance:
            min_distance = distance
            nearest_cluster = cluster_label
    print(f"Nearest cluster found: {nearest_cluster}")
    return nearest_cluster

def sort_new_image(new_image_path, encodings_dict):
    try:
        new_image = Image.open(new_image_path)
    except Exception as e:
        print(f"Error opening the new image: {e}")
        return

    new_face_encoding = face_recognition.face_encodings(np.array(new_image))[0]

    nearest_cluster = find_nearest_cluster(new_face_encoding, encodings_dict)
    if nearest_cluster is not None:
        cluster_directory = os.path.join("sorted faces", f"{nearest_cluster}")
        filename = f"new_face.jpg"
        save_image(new_image, cluster_directory, filename)
        print("New image sorted successfully.")
    else:
        print("No cluster found to sort the new image.")

def main():
    # face_images = fetch_fake_faces(count=100)
    # save_unsorted_faces(face_images)
    cluster_faces(unsorted_directory="unsorted faces")

    encodings_dict = load_encodings()

    # Example: Sort a new image into one of the clusters
    new_image_path = "./new_face.jpg"
    sort_new_image(new_image_path, encodings_dict)

if __name__ == "__main__":
    main()