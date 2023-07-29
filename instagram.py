from instagram_private_api import Client, ClientCompatPatch
import json
import os.path

# Replace 'your_username' and 'your_password' with your Instagram credentials
USERNAME = 'damnwow272'
PASSWORD = 'yotam123yotam'

# Function to load the auth settings from the session file
def load_settings():
    if os.path.isfile('session.json'):
        with open('session.json', 'r') as file:
            return json.load(file)
    return None

# Function to save the auth settings to the session file
def save_settings(settings):
    with open('session.json', 'w') as file:
        json.dump(settings, file)

# Create a new Instagram API client with login persistence
api = Client(USERNAME, PASSWORD, settings=load_settings())

# Check if the API client is logged in by making a request
try:
    user_info = api.user_info(api.authenticated_user_id)
    print('Client is logged in.')
except Exception as e:
    print('Client is not logged in:', e)
    api.login()

    # Save the auth settings to the session file
    save_settings(api.settings)

# Get the list of reels you've liked
liked_reels = api.feed_liked()

# Process the liked reels and extract relevant information (you can adjust this based on your requirements)
liked_reels_data = []
# print(liked_reels['items'][0])
for reel in liked_reels['items']:
    liked_reels_data.append({
        'id': reel['id'],
        'url': f"https://www.instagram.com/reel/{reel['code']}/",
        'username': reel['user']['username']
    })

# Save the liked reels data to a JSON file
with open('liked_reels.json', 'w', encoding='utf-8') as json_file:
    json.dump(liked_reels_data, json_file, ensure_ascii=False, indent=4)

# Logout from the API session (Note: The logout is not necessary, as we are using login persistence)
# api.logout()