#!/bin/sh

echo "Setting up systemd service..."

sudo adduser moonbase_service --system --no-create-home
sudo mkdir /var/lib/alphanet-data
sudo chown moonbase_service /var/lib/alphanet-data
sudo cp $(find /home -type d -name 'moonbeam' | head -n 1)/target/release/moonbeam /var/lib/alphanet-data
sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/master/moonbeam/moonbeam.service --output /etc/systemd/system/moonbeam.service

echo "Moonbeam systemd service has been setup successfully."
