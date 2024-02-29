from flask import Flask
from routers import user, face, songs, reels, media, match
from flask_login import LoginManager
from utils.db.db_models import User
from flask_cors import CORS


app = Flask(__name__)
# Set a secret key for your app
app.secret_key = 'kdpoejsdfneilrhoenfoewfoien'


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
    return User.get(int(id))
    
# Register routers
app.register_blueprint(user.user_bp)
app.register_blueprint(face.face_bp)
app.register_blueprint(songs.songs_bp)
app.register_blueprint(reels.reels_bp)
app.register_blueprint(media.media_bp)
app.register_blueprint(match.match_bp)



if __name__ == '__main__':
    app.run(debug=True, use_reloader=False)