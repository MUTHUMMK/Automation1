terraform {
  backend "s3" {
    bucket         = "terraform-state-lock-s3-bucket"
    key            = "main"   # Change this to a unique name for each configuration
    region         = "ap-southeast-1"            # Change to your desired AWS region
    encrypt        = true                   # Set to true if you want to encrypt the state file
    dynamodb_table = "dynamo-lock" # Optional: Use DynamoDB for locking
  }
}
