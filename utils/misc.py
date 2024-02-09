import os, sys, json

data_dir = os.environ["DATA"]
# Specify the file path
file_path = data_dir + "/rough/output.txt"

def save_output_in_file(file_path, content):

    # Open the file in append mode
    with open(file_path, 'w') as file:
        # Redirect stdout to the file
        sys.stdout = file

        # Call the function whose output you want to append
        print(content)

        # Restore stdout to the original value
        sys.stdout = sys.__stdout__

def json_dump(file_path=os.environ["DATA"]+"/rough/json_dump.json", data):
    # Serialize list into a json file
    with open(file_path, 'w') as f:
        json.dump(data, f, indent=4)