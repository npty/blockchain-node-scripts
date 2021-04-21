#!/bin/sh

# Default value for arguments
name=spacemesh-node
zone=asia-northeast1-a

# Constants
FIREWALL_NAME=spacemesh-service
INSTANCE_TAG=tag-spacemesh-node

# Parsing arguments
## ----- Accepted arguments ------
## -n -> instance name
## -z -> instance zone to be created (see all availables zones with: `gcloud compute zones list`)

while getopts ":n:z" opt; do
  case ${opt} in
  n)
    name=$OPTARG
    ;;
  z)
    zone=$OPTARG
    ;;
  \?)
    echo "Invalid Option: -$OPTARG" 1>&2
    exit 1
    ;;
  :)
    echo "Invalid Option: -$OPTARG requires an argument" 1>&2
    exit 1
    ;;
  esac
done

echo "Creating gcloud instance: $name at zone $zone..."

# Create an instance
gcloud compute instances create "$name" \
  --custom-cpu=4 \
  --custom-memory=8 \
  --zone=$zone \
  --image-family=debian-10 \
  --image-project=debian-cloud

# Resize disk space for an instance to 350GB
echo "Y" | gcloud compute disks resize $name \
  --zone=$zone \
  --size=350

# Restart an instance
gcloud compute instances stop $name --zone=$zone
gcloud compute instances start $name --zone=$zone

# Adding tag to an instance to apply firewall rule
echo "Adding tag to $name instance..."

gcloud compute instances add-tags "$name" \
  --zone=$zone \
  --tags=$INSTANCE_TAG

# Create a firewall rule
echo "Creating firewall rules if needed..."

gcloud compute firewall-rules list | grep $FIREWALL_NAME &>/dev/null

if [ $? == 0 ]; then
  echo "Firewall is already existed. Skipping firewall creation."
else
  gcloud compute firewall-rules create $FIREWALL_NAME \
    --allow=tcp:7153,udp:7153 \
    --description="Allow incoming traffic on TCP port 7153 and UDP port 7153" \
    --target-tags=$INSTANCE_TAG
fi

# Wait for instance to be running
sleep 10s

# SSH to the instance
gcloud beta compute ssh "$name" --zone "$zone" 2>/dev/null