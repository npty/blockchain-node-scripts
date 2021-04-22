#!/bin/sh

echo "Setting up systemd service..."

miner_address=$1

sudo mkdir -p /var/lib/aleo-data
sudo mkdir -p /etc/aleo
sudo cp $HOME/work/snarkOS/target/release/snarkos /var/lib/aleo-data
echo "MINER_ADDRESS=$miner_address" | sudo tee /etc/aleo/aleo-service.env
sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/aleo.service --output /etc/systemd/system/aleo.service

echo "Aleo systemd service has been setup successfully."
