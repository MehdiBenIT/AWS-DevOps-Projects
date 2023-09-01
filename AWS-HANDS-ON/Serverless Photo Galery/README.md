# Serverless Photo Gallery on AWS

## Overview

This project aims to build a Serverless Photo Gallery using AWS services like S3, Lambda, API Gateway, and DynamoDB. This allows you to upload, store, and manage photos without worrying about server maintenance.

## Technologies Used

- AWS S3
- AWS Lambda
- AWS API Gateway
- AWS DynamoDB
- Python

## Features

- Upload photos to an S3 bucket
- Generate thumbnails via Lambda functions
- Expose APIs to manage photos using API Gateway
- Store photo metadata in DynamoDB

## Prerequisites

- AWS Account
- AWS CLI installed and configured
- Python 3.x
  
## Getting Started

### Step 1: Set up your AWS Environment

1. Create an S3 bucket for storing photos.
2. Create a Lambda function and upload the code to handle photo uploads.
3. Set up API Gateway to expose the necessary endpoints.
4. Create a DynamoDB table to store photo metadata.

### Step 2: Configure IAM Roles

Make sure to attach the necessary permissions to your Lambda function to allow it to interact with S3 and DynamoDB.

### Step 3: Deploy Lambda Function

1. Write the Lambda function to upload photos (see `lambda_function.py`).
2. Deploy this function in AWS Lambda.

### Step 4: Set up API Gateway

Create the API endpoints required for uploading, deleting, and fetching photos.

### Step 5: Frontend Development

Develop a frontend to interact with your API Gateway. You can use HTML, CSS, and JavaScript for this purpose.

### Step 6: Monitoring and Logging

Set up AWS CloudWatch for monitoring the application.

## Testing the Application

1. Use Postman or a similar tool to test your API endpoints.
2. Use the frontend to upload and view photos.

## Future Enhancements

- Implement user authentication with AWS Cognito.
- Add a search functionality using tags and descriptions.
