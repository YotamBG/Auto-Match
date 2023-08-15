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


def main():
    genders = ['male', 'female']
    ages = ['19-25','26-35']
    # ethnicities = ['asian', 'black', 'white', 'indian', 'middle_eastern', 'latino_hispanic']
    ethnicities = ['any']

    face_count=200
    for ethnicity in ethnicities:
        for gender in genders:
            images = fetch_fake_faces(count=face_count, gender=gender, age=ages[0], ethnicity=ethnicity)
            unsorted_folder = f"unsorted_faces/unsorted_faces_{gender}_{ethnicity}"
            save_unsorted_faces(unsorted_folder=unsorted_folder, images=images)

if __name__ == "__main__":
    main()