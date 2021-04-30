# Aleo Scripts

https://aleo.org/

## System Requirement

- Ports: 4131, 3030
- CPU: 4 cores
- RAM: 4 GB
- Storage: 128GB
- OS: Debian

## Create Google Cloud Compute Instance (Optional)

> Skip this if you already have an instance.

Run the command below

```
curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/create-gcloud-instance.sh \
    --output create-gcloud-instance.sh && \
    chmod +x create-gcloud-instance.sh && \
    ./create-gcloud-instance.sh -n YOUR_INSTANCE_NAME
```

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

## Monitoring

curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/amon.sh | bash -s -- NODE_IP_ADDRESS SECONDS_TO_RELOAD
