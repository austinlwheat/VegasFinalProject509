

# Load process environment variables from file named ".env". Environment vars
# will be available in the os.environ dictionary.
from dotenv import load_dotenv
load_dotenv()

# Import additional required packages
import datetime as dt
import os
import requests
from google.cloud import storage

credential_path = "final-509-409489d51842.json"
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'D:/graduate/MUSA509/VegasAirflowTutos/final-509-409489d51842.json'

# Retrieve data from URL
print('Downloading the addresses data...')
response = requests.get('https://opendata.arcgis.com/datasets/5e4a5717a3cf4b3a87bae1203a34f7b9_0.geojson')

# Save retrieved data to a local file
print('Saving addresses data to a file...')

outfile_path = f'data/censusgroup.geojson'
with open(outfile_path, mode='wb') as outfile:
    outfile.write(response.content)

# Upload local file of data to Google Cloud Storage
print('Uploading crime data to GCS...')
bucket_name = '1126_data'
blob_name = f'censusgroup.geojson'

storage_robot = storage.Client()
bucket = storage_robot.bucket(bucket_name)
blob = bucket.blob(blob_name)
blob.upload_from_filename(outfile_path)

print('Done')
