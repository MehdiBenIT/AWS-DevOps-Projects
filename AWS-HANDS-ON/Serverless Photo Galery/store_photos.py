import boto3
import base64
import json

def lambda_handler(event, context):
    # Initialize S3 client
    s3 = boto3.client('s3')
    
    # Configuration
    bucket_name = 'serverlessphotogalery'

    # Parse the incoming event to extract parameters
    image_data_base64 = event['body'].get('image_base64', '')
    image_name = event['body'].get('image_name', '')
    
    # Decode the image from base64
    image_data = base64.b64decode(image_data_base64)

    try:
        # Upload image to S3 bucket
        s3.put_object(
            Bucket=bucket_name,
            Key=image_name,
            Body=image_data,
            ContentType='image/jpeg'  # Change content type as needed
        )
        return {
            'statusCode': 200,
            'body': json.dumps(f"Successfully uploaded {image_name} to {bucket_name}")
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(str(e))
        }
