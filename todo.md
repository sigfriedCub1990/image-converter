# TODO:
- SQS
    - [X] Send message to SQS
    - [X] Retrieve message on Microservice
[X] Connect to S3
[X] Upload file to S3
    - Dispatch message to SQS
        - Message should have:
            * S3 Key
            * width
            * height
    - Dispatch completion message to SQS
    - Read message from frontend (notify user?)
- Authenticate user (save session, verify it's logged in, etc)
[] - Persist MongoDB Data in volume
