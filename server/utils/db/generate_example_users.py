import json
import os
import shutil
import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import random
import sys
from PIL import Image
import face_recognition
import numpy as np
from sklearn.cluster import KMeans



# Add the parent directory (root of your project) to the sys path
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
sys.path.append(project_root)

# Now you should be able to perform relative imports
from music.spotify import convert_playlist, get_access_token


def fetch_reels_by_hashtag(hashtag):
    # Set the URL
    url = f"https://www.instagram.com/explore/tags/{hashtag}/"

    # Initialize the WebDriver (change the executable_path to your web driver location)
    driver = webdriver.Chrome()

    # Open the URL in the browser
    driver.get(url)

    # Wait for the page to load, you may need to adjust the sleep time
    time.sleep(5)

    # Scroll down to load more posts
    for _ in range(5):  # You can adjust the number of scrolls as needed
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight)")
        time.sleep(3)

    # Find the post links
    post_links = driver.find_elements(By.TAG_NAME, "a")

    # Extract and print the post URLs
    post_urls = ['https://www.instagram.com/p/'+link.get_attribute("href").split(
        "/p/")[1].split("/")[0] for link in post_links if "/p/" in link.get_attribute("href")]

    # Close the browser
    driver.quit()

    print(post_urls)
    return (post_urls)


def search_playlist(query):
    search_url = 'https://api.spotify.com/v1/search'
    headers = {
        'Authorization': f'Bearer {get_access_token()}'
    }
    params = {
        'q': query,
        'type': 'playlist',
        'limit': 1
    }

    response = requests.get(search_url, headers=headers, params=params)

    if response.status_code == 200:
        playlist_data = response.json()
        playlists = playlist_data.get('playlists', {}).get('items', [])

        if playlists:
            return playlists[0]['external_urls']['spotify']
        else:
            print(f"No playlist found for the query: {query}")
            return None
    else:
        print(
            f"Failed to search for a playlist. Status Code: {response.status_code}")
        return None





def fetch_songs_data():
    music_genres = ["Pop", "Rock", "Hip-Hop", "Jazz", "Classical", "Rap", "Country", "R&B", "Reggaeton", "Reggae", "Blues", "Metal", "Indie", "Disco", "Techno", "K-Pop"]
    
    # Create a dictionary to store the URLs grouped by persona
    urls_by_persona = {}
    for genre in music_genres:
        urls_by_persona[genre] = convert_playlist(search_playlist(genre))[:15]
        
    # Write the data to a JSON file
    with open('songs_grouped_data.json', 'w') as json_file:
        json.dump(urls_by_persona, json_file, indent=4)

    print("Data written to songs_urls_by_persona.json")


def fetch_posts_data():
    # Define the personas with their hashtags
    personas = {
        'cook': ['kitchen', 'knives', 'fruits', 'cooking', 'recipes', 'foodie', 'cheflife', 'homemade', 'culinary', 'chef'],
        'dancer': ['ballet', 'hiphopdance', 'stretching', 'contemporary', 'dancerslife', 'danceperformance', 'choreography', 'dancestudio', 'dancelove', 'flexibility'],
        'coder': ['javascript', 'computerscience', 'programming', 'webdevelopment', 'codinglife', 'opensource', 'developercommunity', 'python', 'codingbootcamp', 'codenewbie'],
        'artist': ['painting', 'sculpture', 'contemporaryart', 'artgallery', 'artstudio', 'creativity', 'visualarts', 'modernart', 'artcollectors', 'artexhibition'],
        'traveler': ['wanderlust', 'adventure', 'travelphotography', 'exploretheworld', 'passportready', 'backpacking', 'traveladdict', 'globetrotter', 'travelgoals', 'travelholic'],
        'fitness': ['workout', 'gymrat', 'fitnessmotivation', 'healthylifestyle', 'strengthtraining', 'fitfam', 'cardio', 'exercise', 'healthandwellness', 'fitnessjourney'],
        'musician': ['musicianslife', 'songwriting', 'guitarist', 'musicproducer', 'singer', 'livemusic', 'bandlife', 'musicindustry', 'musiclovers', 'soundcheck'],
        'reader': ['readinglist', 'bookworm', 'bookish', 'literature', 'bibliophile', 'booknerd', 'bookclub', 'goodreads', 'readmore', 'bookrecommendations'],
        'photographer': ['photographylover', 'portraitphotography', 'landscapephotography', 'travelphotographer', 'photographerlife', 'photographycommunity', 'photooftheday', 'shutterbug', 'visualstorytelling', 'capturethemoment']
    }

    # Create a dictionary to store the URLs grouped by persona
    urls_by_persona = {}
    for persona in personas:
        urls_by_persona[persona] = {}
        for hashtag in personas[persona]:
            post_urls = fetch_reels_by_hashtag(hashtag)
            urls_by_persona[persona][hashtag] = post_urls

    # Write the data to a JSON file
    with open('posts_grouped_data.json', 'w') as json_file:
        json.dump(urls_by_persona, json_file, indent=4)

    print("Data written to post_urls_by_persona.json")


def fetch_faces_data(unsorted_directory='utils/db/faces', num_clusters=8):
    images = []
    print(os.listdir('.'))
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

    groupings = {}

    for cluster_label in set(cluster_labels):
        print(f"Processing cluster {cluster_label}...")
        cluster_indices = np.where(cluster_labels == cluster_label)[0]
        cluster_name = f"cluster_{cluster_label}"
        groupings[cluster_name] = []

        for index in cluster_indices:
            if index < len(images):
                print(f"Image face_{index}.jpg added to {cluster_name}")
                groupings[cluster_name].append(f'face{index}.jpg')


    
    print("Clustering complete.")
    print(groupings)
    
    with open('faces_grouped_data.json', 'w') as json_file:
        json.dump(groupings, json_file, indent=4)

    print("Data written to post_urls_by_persona.json")





def generate_random_liked_reels():
    print(os.path.abspath('.'))
    with open('../db/posts_grouped_data0.json', 'r') as json_file:
        groups_data = json.load(json_file)
    
    # Convert the dictionary values to a list
    persona_list = list(groups_data.values())
    
    # Select 3 persona randomly
    persona_groups = random.sample(persona_list, 3)

    liked_reels = []
    for persona in persona_groups:
        # Select 3 hashtags randomly
        selected_hashtags = random.sample(list(persona.values()), 3)
        # Get 5 posts from each hashtag
        posts = [item for sublist in selected_hashtags for item in sublist[:5]]
        # print(posts)
        liked_reels+=posts
    
    formatted_reels = [{'url': reel, 'username': 'NA', 'id': 'NA'} for reel in liked_reels]
    return formatted_reels


def generate_random_liked_songs():
    with open('../db/songs_grouped_data0.json', 'r') as json_file:
        groups_data = json.load(json_file)
    
    # Convert the dictionary values to a list
    playlist_list = list(groups_data.values())
    
    # Select 3 playlists randomly
    playlist_groups = random.sample(playlist_list, 5)

    liked_songs = []
    for playlist in playlist_groups:
        # Select 9 songs randomly
        songs = random.sample(playlist, 9)
        print(songs)
        liked_songs+=songs
    
    return liked_songs


def generate_random_selected_faces():
    with open('../db/faces_grouped_data0.json', 'r') as json_file:
        groups_data = json.load(json_file)
    
    # Convert the dictionary values to a list
    cluster_list = list(groups_data.values())
    
    # Select 2 clusters randomly
    cluster_groups = random.sample(cluster_list, 2)
    
    return {"liked_faces": cluster_groups[0], "noped_faces": cluster_groups[1]}






from utils.db.db_models import db, users  # Import the necessary database models
from random import choice, randint
from utils.face.train_face import train_face


# Function to generate and insert sample users
def generate_sample_users(num_users):
    
    # List of sample names
    names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Hank', 'Ivy', 'Jack',
             'Katie', 'Liam', 'Mia', 'Noah', 'Olivia', 'Peter', 'Quinn', 'Riley', 'Sophia', 'Tom',
             'Ursula', 'Victor', 'Wendy', 'Xander', 'Yara', 'Zane']
    for i in range(num_users):
        name = names[i]
        email = f"{name.lower()}@example.com"
        password = f"{name}123"
        age = randint(20, 35)
        location = "TLV"
        bio = f"Hi! I'm {name}"
        random_liked_reels = generate_random_liked_reels()
        random_liked_songs = generate_random_liked_songs()
        random_selected_faces = generate_random_selected_faces()

        uploaded_image = face_recognition.load_image_file(f'../db/faces/face{i+100}.jpg')

        # Create a sample user
        user = users(
            name=name,
            email=email,
            password=password,
            age=age,
            location=location,
            bio=bio,
            face_vector=face_recognition.face_encodings(uploaded_image)[0].tolist(),
            liked_faces=random_selected_faces['liked_faces'],
            noped_faces=random_selected_faces['noped_faces'],
            liked_reels=random_liked_reels,
            liked_songs=random_liked_songs,
            filters={'face': 1,'music': 1,'reels': 1}
        )

        # Add the user to the database
        db.session.add(user)
        db.session.commit()
        train_face(user.id, random_selected_faces['liked_faces'], random_selected_faces['noped_faces'])
        shutil.copy(f'../db/faces/face{i+100}.jpg', f'../../storage/{user.id}/profilePic.png'
)
        
    
    # Commit the changes to the database

if __name__ == '__main__':
    generate_sample_users(30)
