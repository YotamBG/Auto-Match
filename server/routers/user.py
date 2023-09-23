from flask_login import login_user, login_required, logout_user, current_user
from flask import render_template, redirect, url_for, flash
from flask import Blueprint, request, jsonify, session
from utils.db.test_db import generate_fake_users
from utils.db.db_models import users
from utils.db.database import db


user_bp = Blueprint('user', __name__)


@user_bp.route('/signIn', methods=['POST'])
def signIn():
    email = request.json.get('email')
    password = request.json.get('password')

    # Check if the user exists in the database
    user = users.query.filter_by(email=email).first()

    if user and user.password == password:
        # session['logged_in'] = True
        res = login_user(user, remember=True)
        return jsonify({"message": f"User login = {res}, userID = {user.id}"}), 200
    else:
        return jsonify({"message": "Invalid credentials"}), 401


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
    existing_user = users.query.filter_by(email=email).first()
    if existing_user:
        return jsonify({"message": "Email already exists"}), 400

    # Create a new user
    new_user = users(
        email=email,
        password=password,
        name=name,
        bio=bio,
        location=location,
        age=age,
    )

    try:
        db.session.add(new_user)
        db.session.commit()


        return jsonify({"message": "User signup successful"}), 200
    except Exception as e:
        db.session.rollback()
        return jsonify({"message": "User signup failed", "error": str(e)}), 500


@user_bp.route('/myProfile', methods=['GET'])
def profile():
    try:
        id = current_user.id
        print(f'current_user.id = {current_user.id}')
        user = users.query.filter_by(id=id).first()
        profile_data = {
            'name': user.name,
            'bio': user.bio,
            'location': user.location,
            'age': user.age,
        }
        return jsonify(profile_data), 200
    
    except Exception as e:
        print(e)
        return jsonify({"message": "Not logged in"}), 401

@user_bp.route('/userProfile/<int:user_id>', methods=['GET'])
def user_profile(user_id):
    try:
        user = users.query.get(user_id)
        if user:
            profile_data = {
                'name': user.name,
                'bio': user.bio,
                'location': user.location,
                'age': user.age,
            }
            return jsonify(profile_data), 200
        else:
            return jsonify({"message": "User not found"}), 404
    
    except Exception as e:
        print(e)
        return jsonify({"message": "Error fetching profile"}), 500


@user_bp.route('/all_users', methods=['GET'])
def get_all_users():
    print('get_all_users!')
    try:
        # Query all users from the User table
        users_first_list = users.query.all()

        # Serialize the user data into a JSON format
        user_list = [{'id': user.id, 'name': user.name, 'location': user.location, 'age': user.age}
                     for user in users_first_list]

        return jsonify({"users": user_list}), 200

    except Exception as e:
        print(e)
        return jsonify({"error": "An error occurred while fetching users"}), 500



@user_bp.route('/profile/update', methods=['PUT'])
def update_profile():
    try:
        user = current_user
        data = request.get_json()
        if 'filters' in data:
            user.filters = data['filters']
        # Update other profile fields as needed
        # ...
        db.session.commit()
        return jsonify({'message': 'Profile updated successfully'}), 200
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': 'Failed to update profile', 'details': str(e)}), 500



@user_bp.route('/generate-example-db', methods=['POST'])
def generate_example_db():
    try:
        # Generate example fake users and add them to the database
        generate_fake_users()
        return jsonify({"message": "Example database generated successfully"}), 200

    except Exception as e:
        print(e)
        return jsonify({"error": "An error occurred while generating the example database"}), 500