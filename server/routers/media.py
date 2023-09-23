import os
from flask import Blueprint, request, jsonify, send_from_directory

media_bp = Blueprint('media', __name__)


def list_pics(folder_path, num_pics):
    # Check if the specified folder exists
    full_path = os.path.abspath(folder_path)
    print('Full Path:', full_path)
    if not os.path.exists(folder_path):
        return jsonify({"error": "Folder not found"}), 404

    # Get a list of image files in the folder
    image_files = [f for f in os.listdir(folder_path) if f.endswith('.jpg')]

    # Limit the number of pictures to serve based on the num_pics parameter
    num_pics = min(num_pics, len(image_files))

    # Serve the selected images
    served_images = image_files[:num_pics] 


    return jsonify({"message": "Pics served", "images": served_images}), 200


@media_bp.route('/pics/catalog/<int:num_pics>', methods=['GET'])
def catalog_pics(num_pics):
    print('catalog!')
    # return os.getcwd()
    return list_pics('catalog-faces', num_pics)

@media_bp.route('/pic/<folder_name>/<image_name>', methods=['GET'])
def serve_pic(folder_name, image_name):
    # Check which folder to serve images from
    if folder_name == 'catalog':
        folder_path = './utils/face/catalog-faces'
    else:
        folder_path = f'./storage/{folder_name}'


    # Serve the image
    print(folder_path)
    print(image_name)
    return send_from_directory(folder_path, image_name)



# add route to fetch users pics