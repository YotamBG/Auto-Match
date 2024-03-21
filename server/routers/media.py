import os
from flask import Blueprint, jsonify, send_from_directory
from natsort import natsorted

media_bp = Blueprint('media', __name__)


@media_bp.route('/pic/<folder_name>/<image_name>', methods=['GET'])
def serve_pic(folder_name, image_name):
    try:
        # Check which folder to serve images from
        if folder_name == 'catalog':
            folder_path = './utils/face/catalog-faces'
        else:
            folder_path = f'./storage/{folder_name}'


        # Serve the image
        print(folder_path)
        print(image_name)
        return send_from_directory(folder_path, image_name)
    except Exception as e:
        print(e)
        return send_from_directory('./utils/face', 'blank_face.png')




# add route to fetch users pics



def list_pics(folder_path, page):
    # Check if the specified folder exists
    full_path = os.path.abspath(folder_path)
    print('Full Path:', full_path)
    if not os.path.exists(folder_path):
        return jsonify({"error": "Folder not found"}), 404

    # Get a list of image files in the folder
    image_files = [f for f in os.listdir(folder_path) if f.endswith('.jpg')]

    # Sort the image files by name
    sorted_image_files = natsorted(image_files)

    print('sorted_image_files:')
    print(sorted_image_files)

    # Calculate the range of images to serve for the given page
    start_index = (page - 1) * 60
    end_index = page * 60

    # Serve the selected images
    served_images = sorted_image_files[start_index:end_index]

    return jsonify({"message": "Pics served", "images": served_images}), 200


@media_bp.route('/pics/catalog/<int:page>', methods=['GET'])
def catalog_pics(page):
    print('catalog!')
    # return os.getcwd()
    return list_pics('catalog-faces', page)
