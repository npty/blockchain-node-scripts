#!/bin/sh

echo "Setting up systemd service..."

sudo adduser spacemesh_service --system --no-create-home
sudo mkdir /var/lib/spacemesh-data
sudo chown spacemesh_service /var/lib/spacemesh-data
sudo cp $(find /home -type d -name 'go-spacemesh' | head -n 1)/build/go-spacemesh /var/lib/spacemesh-data
sudo curl https://discover.spacemesh.io/conf/28/config.json --output /var/lib/spacemesh-data/config.json
sudo curl https://raw.githubusercontent.com/npty/moonbeam-node-script/spacemesh/spacemesh.service --output /etc/systemd/system/spacemesh.service

echo "Moonbeam systemd service has been setup successfully."
