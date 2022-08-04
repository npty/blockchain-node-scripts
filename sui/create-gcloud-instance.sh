#!/bin/sh

# Default value for arguments
source setenv.sh

# Parsing arguments
# ----- Accepted arguments ------
# -n -> instance name
# -z -> instance zone to be created (see all availables zones with: `gcloud compute zones list`)

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
  --custom-cpu=2 \
  --custom-memory=8 \
  --zone=$zone \
  --image-family=$image_family \
  --image-project=$image_project

# Resize disk space for an instance to 50GB
echo "Y" | gcloud compute disks resize $name \
  --zone=$zone \
  --size 50

# Restart an instance
gcloud compute instances stop $name --zone=$zone
gcloud compute instances start $name --zone=$zone

Adding tag to an instance to apply firewall rule
echo "Adding tag to $name instance..."

gcloud compute instances add-tags "$name" \
  --zone=$zone \
  --tags=$instance_tag

# Create a firewall rule
echo "Creating firewall rules if needed..."

gcloud compute firewall-rules list | grep $firewall_name &>/dev/null

if [ $? == 0 ]; then
  echo "Firewall is already existed. Skipping firewall creation."
else
  gcloud compute firewall-rules create $firewall_name \
    --allow=tcp:9000,tcp:9184 \
    --description="Allow incoming traffic on TCP port 9000 and 9184" \
    --target-tags=$instance_tag
fi
