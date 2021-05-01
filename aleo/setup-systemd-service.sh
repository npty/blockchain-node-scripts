#!/bin/sh

echo "Setting up systemd service..."

miner_address=$1

sudo adduser aleo_service --system
sudo mkdir -p /var/lib/aleo-data
sudo mkdir -p /etc/aleo
sudo cp $HOME/work/snarkOS/target/release/snarkos /var/lib/aleo-data
sudo chown aleo_service /var/lib/aleo-data

if [ -z '$miner_address']; then
  sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/aleo-without-mining.service --output /etc/systemd/system/aleo.service
else
  echo "MINER_ADDRESS=$miner_address" | sudo tee /etc/aleo/aleo-service.env
  sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/aleo.service --output /etc/systemd/system/aleo.service
fi

echo "Aleo systemd service has been setup successfully."
