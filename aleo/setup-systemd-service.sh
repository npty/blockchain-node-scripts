#!/bin/sh

echo "Setting up systemd service..."

sudo mkdir -p /var/lib/aleo-data
sudo cp $HOME/work/snarkOS/target/release/snarkos /var/lib/aleo-data
sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/aleo.service --output /etc/systemd/system/aleo.service

echo "Aleo systemd service has been setup successfully."
