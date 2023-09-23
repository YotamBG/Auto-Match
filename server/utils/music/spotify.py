import spotipy
from spotipy.oauth2 import SpotifyOAuth
import json

def fetch_liked_songs():
    # Replace 'your_client_id' and 'your_client_secret' with your actual client ID and client secret from the Spotify Developer Dashboard
    client_id = 'd98e83fa24b147f68a89da1e76e0690e'
    client_secret = 'e06ae60fb78b4831a6bc1c99fefbd9b9'

    # Create a Spotipy client with OAuth authentication
    sp = spotipy.Spotify(auth_manager=SpotifyOAuth(client_id=client_id, client_secret=client_secret, scope="user-library-read", redirect_uri="http://localhost"))

    # Get the user's liked songs
    liked_songs = []
    offset = 0
    limit = 50
    while True:
        results = sp.current_user_saved_tracks(limit=limit, offset=offset)
        for item in results['items']:
            track = item['track']
            song_info = {
                'name': track['name'],
                'id': track['id'],
                'link': track['external_urls']['spotify'],
                'artist': track['artists'][0]['name']  # Assuming there is only one artist per track
            }
            liked_songs.append(song_info)
        if len(results['items']) < limit:
            break
        offset += limit

    return liked_songs

def write_to_json_file(data):
    with open('liked_songs.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)

def main():
    try:
        # Fetch liked songs
        liked_songs = fetch_liked_songs()

        # Write to the JSON file
        write_to_json_file(liked_songs)
        print("Liked songs fetched and saved successfully.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()

















# import spotipy
# from spotipy.oauth2 import SpotifyOAuth
# import json

# def fetch_liked_songs():
#     # Replace 'your_client_id' and 'your_client_secret' with your actual client ID and client secret from the Spotify Developer Dashboard
#     client_id = 'd98e83fa24b147f68a89da1e76e0690e'
#     client_secret = 'e06ae60fb78b4831a6bc1c99fefbd9b9'

#     # Create a Spotipy client with OAuth authentication
#     sp = spotipy.Spotify(auth_manager=SpotifyOAuth(client_id=client_id, client_secret=client_secret, scope="user-library-read", redirect_uri="http://localhost"))

#     # Get the user's liked songs
#     liked_songs = []
#     offset = 0
#     limit = 50
#     while True:
#         results = sp.current_user_saved_tracks(limit=limit, offset=offset)
#         liked_songs.extend(results['items'])
#         if len(results['items']) < limit:
#             break
#         offset += limit

#     return liked_songs

# def write_to_json_file(data):
#     with open('liked_songs.json', 'w', encoding='utf-8') as f:
#         json.dump(data, f, ensure_ascii=False, indent=4)

# def main():
#     try:
#         # Fetch liked songs
#         liked_songs = fetch_liked_songs()

#         # Write to the JSON file
#         write_to_json_file(liked_songs)
#         print("Liked songs fetched and saved successfully.")
#     except Exception as e:
#         print(f"Error: {e}")

# if __name__ == "__main__":
#     main()
