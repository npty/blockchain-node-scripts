#!/bin/sh

echo "Setting up systemd service..."

port=$1

sudo adduser meson_service --system --no-create-home 2>/dev/null
sudo mkdir -p /var/lib/meson-data
sudo mkdir -p /etc/meson
echo "Select port=$port" | sudo tee /etc/meson/meson-service.env
sudo chown -R meson_service /var/lib/meson-data
sudo cp ~/meson-linux-amd64 /var/lib/meson-data
#sudo curl https://discover.spacemesh.io/conf/28/config.json --output /var/lib/spacemesh-data/config.json
sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/meson.service --output /etc/systemd/system/meson.service

echo "Meson systemd service has been setup successfully."