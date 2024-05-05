from flask import Blueprint, request, jsonify
from utils.db.db_models import User  # Import the User model
from flask_login import login_user, logout_user, current_user
from utils.db.database import driver
import bcrypt

user_bp = Blueprint('user', __name__)



# Function to hash password using Bcrypt
def hash_password(password):
    hashed_bytes = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
    return hashed_bytes.decode('utf-8')

@user_bp.route('/signIn', methods=['POST'])
def signIn():
    email = request.json.get('email')
    password = request.json.get('password')

    try:
        # Check if the user exists in the database
        user = User.get_by_email(email)
        
        if user:
            stored_password = user.node.get('password', '')
            
            if stored_password and bcrypt.checkpw(password.encode('utf-8'), stored_password.encode('utf-8')):
                # Handle login using Flask-Login
                login_user(user, remember=True)
                user_id = user.node['id']
                return jsonify({"message": f"User {user_id} logged in successfully"}), 200
            else:
                return jsonify({"error": "Invalid credentials"}), 401
        else:
            return jsonify({"error": "User not found"}), 404
    
    except Exception as e:
        print(e)  # Log the error for debugging
        return jsonify({"error": "An error occurred while signing in"}), 500


@user_bp.route('/signUp', methods=['POST'])
def signup():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')
    name = data.get('name')
    bio = data.get('bio')
    location = data.get('location')
    age = data.get('age')

    # Check if email already exists
    if User.get_by_email(email):
        return jsonify({"message": "Email already exists"}), 400

    # Hash the password
    hashed_password = hash_password(password)

    # Create a new user with hashed password
    new_user = User.create({'email':email, 'password':hashed_password, 'name':name, 'bio':bio, 'location':location, 'age':age})

    return jsonify({"message": "User signup successful"}), 200

@user_bp.route('/logout', methods=['POST'])
def logout():
    # Log the user out
    logout_user()
    return jsonify({"message": "User logged out"}), 200

@user_bp.route('/my-profile', methods=['GET'])
def profile():
    try:
        print(f'Received Cookies:{request.cookies}')
        # Print out the received cookies
        user_id = current_user.get_id()
        print('!!!')
        print(user_id)
        print('!!!')
        user = User.get(user_id).node
        profile_data = {
            'name': user['name'],
            'bio': user['bio'],
            'id': user_id,
            'location': user['location'],
            'age': user['age'],
            'filters': user['filters'],
        }
        return jsonify(profile_data), 200
    except Exception as e:
        print(e)
        return jsonify({"message": "Not logged in"}), 401

@user_bp.route('/user-profile/<int:user_id>', methods=['GET'])
def user_profile(user_id):
    try:
        user = User.get(str(user_id)).node
        if user:
            profile_data = {
                'name': user['name'],
                'bio': user['bio'],
                'location': user['location'],
                'age': user['age'],
                'id': user_id,
            }
            return jsonify(profile_data), 200
        else:
            return jsonify({"message": "User not found"}), 404
    
    except Exception as e:
        print(e)
        return jsonify({"message": "Error fetching profile"}), 500

@user_bp.route('/all_users', methods=['GET'])
def get_all_users():
    try:
        users = User.get_all_users()
        user_list = [
            {'id': user['id'], 'name': user['name'], 'location': user['location'], 'age': user['age']}
            for user in users
        ]
        return jsonify({"users": user_list}), 200

    except Exception as e:
        print(e)
        return jsonify({"error": "An error occurred while fetching users"}), 500


@user_bp.route('/profile/update', methods=['PUT'])
def update_profile():
    try:
        user_id = current_user.id
        data = request.get_json()
        
        # Check if weights are provided in the request
        if 'face_filter_weight' in data and 'songs_filter_weight' in data and 'reels_filter_weight' in data:
            face_filter_weight = int(data.get('face_filter_weight'))
            songs_filter_weight = int(data.get('songs_filter_weight'))
            reels_filter_weight = int(data.get('reels_filter_weight'))
            total = face_filter_weight + songs_filter_weight + reels_filter_weight

            # Update weights
            with driver.session() as session:
                session.run(
                    f"""
                    MATCH (u:User {{id: '{user_id}'}})
                    SET u.face_filter_weight = {face_filter_weight/total},
                        u.songs_filter_weight = {songs_filter_weight/total},
                        u.reels_filter_weight = {reels_filter_weight/total}
                    """
                )
        
        # Check if location is provided in the request
        if 'location' in data:
            location = data.get('location')
            # Update location
            with driver.session() as session:
                session.run(
                    f"""
                    MATCH (u:User {{id: '{user_id}'}})
                    SET u.location = '{location}'
                    """
                )

        return jsonify({'message': 'Profile updated successfully'}), 200
    except Exception as e:
        print(e)
        return jsonify({'error': 'Failed to update profile', 'details': str(e)}), 500

# Update users' passwords endpoint
@user_bp.route('/update_passwords', methods=['POST'])
def update_passwords():
    # Connect to Neo4j
    session = driver.session()

    # Retrieve all users from Neo4j
    cypher_query = "MATCH (u:User) RETURN u"
    result = session.run(cypher_query)

    # Iterate over each user and update password
    for record in result:
        user_node = record["u"]
        old_password = user_node["name"].split(' ')[0]+'123' # user_node["password"]
        
        # Hash the password
        hashed_password = hash_password(old_password)
        print(f'{user_node["name"]}: {str(old_password)} => {str(hashed_password)}')

        # Update the user node with the hashed password
        update_query = f"""
        MATCH (u:User {{id: $user_id}})
        SET u.password = $hashed_password
        """
        session.run(update_query, user_id=user_node["id"], hashed_password=str(hashed_password))

    # Close Neo4j session and driver
    session.close()
    driver.close()

    return jsonify({"message": "Passwords updated successfully"})