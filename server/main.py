import subprocess
from flask import Flask
from routers import user, face, music, reels, media, match
from flask_login import LoginManager
from utils.db.db_models import users
from flask_cors import CORS


app = Flask(__name__)
# Set a secret key for your app
app.secret_key = 'kdpoejsdfneilrhoenfoewfoien'

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost/AUTO-MATCH'

# Configure session cookie attributes
app.config['SESSION_COOKIE_SECURE'] = False  # Disable secure attribute for local testing
app.config['SESSION_COOKIE_HTTPONLY'] = True  # Enable HttpOnly attribute (recommended)

# Configure CORS to allow requests from all origins
cors = CORS(app, supports_credentials=True)


# setup login manager
login = LoginManager()
login.init_app(app)
@login.user_loader
def load_user(id):
    return users.query.get(int(id))
    
# Initialize the SQLAlchemy database object
from utils.db.database import db  # Import db from the database module

# Initialize db
db.init_app(app)

# Register routers
app.register_blueprint(user.user_bp)
app.register_blueprint(face.face_bp)
app.register_blueprint(music.music_bp)
app.register_blueprint(reels.reels_bp)
app.register_blueprint(media.media_bp)
app.register_blueprint(match.match_bp)



if __name__ == '__main__':
    app.run(debug=True, use_reloader=False)