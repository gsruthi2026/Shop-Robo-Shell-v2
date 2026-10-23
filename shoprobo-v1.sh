#!/bin/bash

ami_ids="ami-0055977a6e828a4f4"
instance_types="t3.micro"
domain_name="daws92s.store"
hosted_zone_id="get above domain hosted zone id in aws"

for instance in $@
do
  echo "Creating instances from  shoprobo ec2 instance"
      instance_id=$(aws ec2 run-instances \
   --image-id $ami_ids \
    --instance-type $instance_types \
    --security-groups "shoprobo-common" "shoprobo-$instance" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=shoprobo-$instance}]" \
    --query 'Instances[0].InstanceId' \
    --output text
      echo "instance_id :: ${instance_id} "
      )
