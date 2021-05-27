#!/bin/sh

echo "Setting up systemd service..."

wallet_address=$1

sudo curl https://storage.googleapis.com/go-spacemesh-release-builds/v0.1.29/ubuntu-latest/go-spacemesh -o go-spacemesh
sudo chmod 777 go-spacemesh

sudo curl https://github.com/spacemeshos/cli-wallet/releases/download/v0.1.22/cli_wallet_linux_amd64 -o cli_wallet_linux_amd64
sudo chmod 777 cli_wallet_linux_amd64

sudo curl https://storage.googleapis.com/spacecraft-data/tweedlelite128-archive/config.json -o config.json
sudo chmod 777 config.json

sudo mkdir -p /etc/spacemesh
echo "WALLET_ADDR=$wallet_address" | sudo tee /etc/spacemesh/spacemesh-service.env

sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/spacemesh/spacemesh.service --output /etc/systemd/system/spacemesh.service

echo "Spacemesh systemd service has been setup successfully."
echo "Use ""./cli_wallet_linux_amd64"". to access wallet"
sudo systemctl enable spacemesh.service
sudo systemctl start spacemesh.service
