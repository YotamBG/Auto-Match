# from main import db
from sqlalchemy import ARRAY, JSON
from utils.db.database import db
from flask_login import UserMixin
# Configure your PostgreSQL database URI

class users(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)

    name = db.Column(db.String(255))
    email = db.Column(db.String(255))
    password = db.Column(db.String(255))
    age = db.Column(db.Integer)
    location = db.Column(db.String(255))
    bio = db.Column(db.String(255))

    face_vector = db.Column(ARRAY(db.String(255)))
    liked_faces = db.Column(ARRAY(db.String(255)))
    noped_faces = db.Column(ARRAY(db.String(255)))
    liked_reels = db.Column(JSON)
    liked_songs = db.Column(JSON)

    filters = db.Column(JSON)

class matches(db.Model):
    match_id = db.Column(db.Integer, primary_key=True)
    current_user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    candidate_user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    face_match_percent = db.Column(db.Float)
    reels_match_percent = db.Column(db.Float)
    songs_match_percent = db.Column(db.Float)
    total_match_percent = db.Column(db.Float)
    decision = db.Column(db.Boolean)

    # Define relationships with the Users table
    # user1 = db.relationship('users', foreign_keys=[current_user_id])
    # user2 = db.relationship('users', foreign_keys=[candidate_user_id])