# Aleo Scripts

https://aleo.org/

## System Requirement

Ports required: 4131, 3030

CPU: 4 cores
RAM: 32GB
OS: Ubuntu 18 or 20
Storage: 128GB

## Install deps and build Aleo binary

Run the following command to run all required steps:

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/barebone-aleo-setup.sh | bash`

## Generate wallet

Run `aleo new`

## Setup systemd service

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/setup-systemd-service.sh | bash -s -- MINER_ADDRESS`

## Run Aleo systemd service

```
sudo systemctl enable aleo.service
sudo systemctl start aleo.service
```

You can verify the service is running with:
`sudo systemctl status aleo.service`

You can also check the logs by executing:
`sudo journalctl -f -u aleo.service`

## Upgrade Aleo Node

First stop the node by `sudo systemctl stop aleo`

Then, rerun the following command.

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/barebone-aleo-setup.sh | bash`

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/setup-systemd-service.sh | bash -s -- MINER_ADDRESS`

Next, run `sudo systemctl daemon-reload` to apply the updated service.

Finally, run `sudo systemctl start aleo.service`
