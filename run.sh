
#!/bin/bash

#Terraform use to create the infrastructure for instances
terraform init && terraform plan && terraform apply -auto-approve

# to get public IP and store the variable 
a=$(aws ec2 describe-instances --region ap-southeast-1 --filters 'Name=tag:Name,Values=MMK' --query 'Reservations[].Instances[].PublicIpAddress' --output text)

echo $a

# login the ssh-remote server & put the variable instead of public ip
sudo scp -o StrictHostKeyChecking=no -i adi.pem docker-compose.yml ubuntu@$a:/home/ubuntu
sudo ssh -o StrictHostKeyChecking=no -i adi.pem ubuntu@$a<<EOF
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