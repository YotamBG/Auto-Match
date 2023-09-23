from faker import Faker
import random
from utils.db.db_models import db, users  # Import the necessary database models

def generate_fake_users():
    fake = Faker()

    # Define lists of interests and songs for generating liked_reels and liked_songs
    interests = ["Travel", "Cooking", "Fitness", "Photography", "Movies", "Music", "Fashion", "Sports", "Gaming", "Books"]
    songs = ["Bohemian Rhapsody", "Billie Jean", "Hotel California", "Imagine", "Smells Like Teen Spirit", "Like a Rolling Stone", "Yesterday", "Purple Haze", "Hey Jude", "Wonderwall"]
    bios = [
        "Adventure seeker. Coffee lover. Dog parent.",
        "Foodie at heart. Movie enthusiast. Beach bum.",
        "Fitness freak. Nature explorer. Bookworm.",
        "Music addict. Travel junkie. Tech geek.",
        "Art lover. Wine connoisseur. Star gazer.",
        "Outdoor enthusiast. Hiker. Environmental advocate.",
        "Fashionista. Trendsetter. Glamour and glitz.",
        "Science nerd. Curious mind. Stargazing at night.",
        "Tech wizard. Coding ninja. Innovating the future.",
        "Yoga practitioner. Mindfulness. Inner peace seeker."
    ]

    # Create a SQLAlchemy session
    session = db.session

    for i in range(10):  # Generate 10 fake users
        fake_user = {
            'name': fake.name(),
            'age': random.randint(20, 30),
            'location': random.choice(["NYC", "TLV", "LA"]),
            'bio': bios[i],
            'password': fake.password(),
            'email': fake.email(),
            'face_vector': ['3', '3', '3'],
            'liked_faces': ['3', '3', '3'],
            'liked_reels': random.sample(interests, 5),
            'liked_songs': random.sample(songs, 5)
        }

        # Create a new user record and add it to the session
        new_user = users(**fake_user)
        session.add(new_user)

    # Commit the changes to the database
    session.commit()

    # Close the session
    session.close()

if __name__ == "__main__":
    generate_fake_users()
