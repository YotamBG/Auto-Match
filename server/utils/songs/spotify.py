import json
from flask import jsonify
import requests
import requests


# Get an access token to access the Spotify API
def get_access_token(client_id='d98e83fa24b147f68a89da1e76e0690e', client_secret='e06ae60fb78b4831a6bc1c99fefbd9b9'):
    token_url = 'https://accounts.spotify.com/api/token'
    payload = {'grant_type': 'client_credentials'}
    auth = (client_id, client_secret)
    response = requests.post(token_url, data=payload, auth=auth)
    
    if response.status_code == 200:
        token_data = response.json()
        return token_data.get('access_token')
    else:
        print(f"Failed to obtain an access token. Status Code: {response.status_code}")
        return None
    



def convert_playlist(playlist_url):
    try:
        print(playlist_url)
        liked_songs = []

        # Extract the playlist ID from the URL
        playlist_id = playlist_url.split('/')[-1]

        # Make a request to the Spotify API to fetch playlist data
        spotify_api_url = f'https://api.spotify.com/v1/playlists/{playlist_id}/tracks'
        headers = {
            'Authorization': f'Bearer {get_access_token()}'
        }
        response = requests.get(spotify_api_url, headers=headers)

        playlist_data = json.loads(response.text)
        # print(playlist_data)
        tracks = playlist_data['tracks']['items']
        for item in tracks:
            track = item['track']
            song_info = {
                'name': track['name'],
                'id': track['id'],
                'link': track['external_urls']['spotify'],
                'artist': track['artists'][0]['name']  # Assuming there is only one artist per track
            }
            liked_songs.append(song_info)
        print('liked_songs:')
        print(liked_songs)
        # print(liked_songs)
        return liked_songs


    except Exception as e:
        print('oops')
        print(e)
        return str(e)
        # return jsonify({'error': str(e)}), 500

