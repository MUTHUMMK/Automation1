#!/bin/bash

set -e

#Terraform use to create the infrastructure for instances
terraform init && terraform apply -auto-approve "-lock = false" 

# to get public IP and store the variable 
a=$(aws ec2 describe-instances --region ap-southeast-1 --filters 'Name=tag:Name,Values=MMK' --query 'Reservations[].Instances[].PublicIpAddress' --output text)

echo $a
export psw=$1

# login the ssh-remote server & put the variable instead of public ip
scp -o StrictHostKeyChecking=no -i $psw docker-compose.yml ubuntu@$a:/home/ubuntu
ssh -o StrictHostKeyChecking=no -i $psw ubuntu@$a<<EOF
sudo apt-get update -y
ls

sudo apt-get install docker.io -y
sudo apt-get install docker-compose -y

sudo docker-compose up -d

sudo systemctl start docker

if curl localhost:80
then
  echo "deploy successed"
fi

echo "deploy success"
EOF
