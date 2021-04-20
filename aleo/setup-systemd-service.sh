#!/bin/sh

echo "Setting up systemd service..."

sudo adduser aleo_service --system --no-create-home 2>/dev/null
sudo mkdir -p /var/lib/aleo-data
sudo chown -R aleo_service /var/lib/aleo-data
sudo cp $HOME/.cargo/bin/snarkos /var/lib/aleo-data
sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/aleo.service --output /etc/systemd/system/aleo.service

echo "Aleo systemd service has been setup successfully."
