import os
import requests
from PIL import Image
from io import BytesIO
import face_recognition
import numpy as np
from sklearn.cluster import DBSCAN

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
    # Read images from 'unsorted faces' directory
    unsorted_images = []
    for filename in os.listdir(unsorted_directory):
        filepath = os.path.join(unsorted_directory, filename)
        try:
            image = Image.open(filepath)
            unsorted_images.append(np.array(image))
        except Exception as e:
            print(f"Error processing the image {filename}: {e}")
    print("Images loaded.")

    print("Strating encoding...")
    face_encodings = [face_recognition.face_encodings(image)[0] for image in unsorted_images]
    print("Finished encoding!")
    

    # Try different values of eps to find the best separation
    clustering = DBSCAN(eps=0.5, min_samples=2).fit(face_encodings)
    num_clusters = len(set(clustering.labels_))
    print(f"Number of clusters: {num_clusters}")
    for cluster_label in set(clustering.labels_):
        if cluster_label == -1:  # Outliers (noise points)
            continue
        cluster_indices = np.where(clustering.labels_ == cluster_label)[0]
        for index in cluster_indices:
            if index < len(unsorted_images):
                image = unsorted_images[index]
                cluster_directory = os.path.join("sorted faces", f"cluster_{cluster_label}")
                os.makedirs(cluster_directory, exist_ok=True)
                filename = f"face_{index}.jpg"
                save_image(image, cluster_directory, filename)


# face_images = fetch_fake_faces(count=100)
# save_unsorted_faces(face_images)
cluster_faces(unsorted_directory="unsorted faces")