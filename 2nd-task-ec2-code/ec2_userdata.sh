#!/bin/bash
# Update system and install dependencies
sudo apt update -y
sudo apt install python3.8 -y
sudo pip3 install flask boto3

# copy the app code
cat <<EOF > /home/ec2-user/app.py
from flask import Flask, jsonify
import boto3
from botocore.exceptions import ClientError, NoCredentialsError, PartialCredentialsError

app = Flask(__name__)
BUCKET_NAME = "equip9-task-bucket"

s3_client = boto3.client('s3')

@app.route('/list-bucket-content/', defaults={'path': ''}, methods=['GET'])
@app.route('/list-bucket-content/<path:path>', methods=['GET'])
def list_bucket_content(path):
    try:
        response = s3_client.list_objects_v2(Bucket=BUCKET_NAME, Prefix=path, Delimiter='/')
        if 'Contents' not in response and 'CommonPrefixes' not in response:
            return jsonify({"content": []})

        contents = []
        if 'CommonPrefixes' in response:
            contents.extend([prefix['Prefix'].rstrip('/') for prefix in response['CommonPrefixes']])
        if 'Contents' in response:
            contents.extend([content['Key'] for content in response['Contents'] if content['Key'] != path])

        return jsonify({"content": contents})

    except NoCredentialsError:
        return jsonify({"error": "AWS credentials not configured"}), 500
    except PartialCredentialsError:
        return jsonify({"error": "Incomplete AWS credentials"}), 500
    except ClientError as e:
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        return jsonify({"error": "An unexpected error occurred: " + str(e)}), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)

EOF

# Run the application
nohup python3 /home/ec2-user/app.py 
