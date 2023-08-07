#!/bin/bash

a=$(aws ec2 describe-instances --region ap-southeast-1 --filters 'Name=tag:Name,Values=MMK' --query 'Reservations[].Instances[].PublicIpAddress' --output text)

echo $a

