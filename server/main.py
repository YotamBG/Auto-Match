from datetime import timedelta
from flask import Flask, request
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
app.config['REMEMBER_COOKIE_DURATION'] = timedelta(days=30)  # Set expiry to 30 days


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

# Middleware to support flutter web:
class SameSiteMiddleware:
    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        def modified_start_response(status, headers, exc_info=None):
            modified_headers = [(key, value) for key, value in headers if key.lower() != 'set-cookie']
            for key, value in headers:
                if key.lower() == 'set-cookie':
                    value += '; SameSite=None; Secure'
                    modified_headers.append((key, value))
            return start_response(status, modified_headers, exc_info)

        return self.app(environ, modified_start_response)
app.wsgi_app = SameSiteMiddleware(app.wsgi_app)

@app.before_request
def log_received_cookies():
    print(f'Received Cookies: {request.cookies}')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True, use_reloader=False)