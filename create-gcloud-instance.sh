#!/bin/sh

# Default value for arguments
name=custom-node
zone=asia-southeast2-a

# Constants
FIREWALL_NAME=moonbeam-service
INSTANCE_TAG=tag-polkadot-node

# Parsing arguments
## ----- Accepted arguments ------
## -n -> instance name 
## -z -> instance zone to be created (see all availables zones with: `gcloud compute zones list`)

while getopts ":n:z" opt; do
  case ${opt} in
    n )
      name=$OPTARG
      ;;
    z )
      zone=$OPTARG
      ;;
    \? )
      echo "Invalid Option: -$OPTARG" 1>&2
      exit 1
      ;;
    : )
      echo "Invalid Option: -$OPTARG requires an argument" 1>&2
      exit 1
      ;;
  esac
done

echo "Creating gcloud instance: $name at zone $zone..."

# Create an instance
gcloud compute instances create "$name" \
  --custom-cpu=8 \
  --custom-memory=16 \
  --zone=asia-southeast2-a \
  --image-family=debian-10 \
  --image-project=debian-cloud

# Resize disk space for an instance to 50GB
echo "Y" | gcloud compute disks resize $name \
  --zone=$zone \
  --size 50

# Restart an instance
gcloud compute instances stop $name --zone=$zone
gcloud compute instances start $name --zone=$zone

# Adding tag to an instance to apply firewall rule
echo "Adding tag to $name instance..."

gcloud compute instances add-tags "$name" \
  --zone=asia-southeast2-a \
  --tags=$INSTANCE_TAG

# Create a firewall rule
echo "Creating firewall rules if needed..."

gcloud compute firewall-rules list | grep $FIREWALL_NAME &> /dev/null

if [ $? == 0 ]; then
  echo "Firewall is already existed. Skipping firewall creation."
else
  gcloud compute firewall-rules create $FIREWALL_NAME \
    --allow=tcp:30333,tcp:30334 \
    --description="Allow incoming traffic on TCP port 30333 and 30334" \
    --target-tags=$INSTANCE_TAG
fi

# Wait for instance to be running
sleep 10s

# SSH to the instance
gcloud beta compute ssh "$name" --zone "$zone" 2> /dev/null

