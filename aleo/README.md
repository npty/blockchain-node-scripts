# Aleo Scripts

Ports required: 4131, 3030

## Setup Aleo Node

Run the following command to run all required steps:

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/barebone-aleo-setup.sh | bash`

## Setup systemd service

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/setup-systemd-service.sh | bash -s -- MINER_ADDRESS`

## Run aleo Node

```
sudo systemctl enable aleo.service
sudo systemctl start aleo.service
```

You can verify the service is running with:
`sudo systemctl status aleo.service`

You can also check the logs by executing:
`sudo journalctl -f -u aleo.service`

## Upgrade aleo Node

`sudo systemctl stop aleo`

Then, rerun setup aleo Node script.

Once it completed, run `sudo systemctl start aleo.service`
