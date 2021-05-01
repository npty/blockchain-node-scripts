# Aleo Scripts

https://aleo.org/

## Minimum System Requirement

- Ports: 4131, 3030
- CPU: 4 cores
- RAM: 6 GB
- Storage: 128GB
- OS: Debian 10

## Create Google Cloud Compute Instance (Optional)

> Skip this if you already have an instance.

Run the command below (Required [gcloud](https://cloud.google.com/sdk/docs/quickstart))

```
curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/create-gcloud-instance.sh \
    --output create-gcloud-instance.sh && \
    chmod +x create-gcloud-instance.sh && \
    ./create-gcloud-instance.sh -n YOUR_INSTANCE_NAME
```

> Note: Replace YOUR_INSTANCE_NAME with your desired name

## Install deps and build Aleo binary

Run the following command to run all required steps:

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/barebone-aleo-setup.sh | bash`

## Generate wallet

Run `aleo new`

## Setup systemd service

**Enable Mining**

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/setup-systemd-service.sh | bash -s -- MINER_ADDRESS`

> Note: Replace your MINER_ADDRESS with your aleo wallet address

**Disable Mining**

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/setup-systemd-service.sh | bash`

## Run Aleo systemd service

```
sudo systemctl enable aleo.service
sudo systemctl start aleo.service
```

You can verify the service is running with:
`sudo systemctl status aleo.service`

You can also check the logs by executing:
`sudo journalctl -f -o cat -u aleo.service`

## Upgrade Aleo Node

First stop the node by `sudo systemctl stop aleo`

Then, rerun the following command.

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/barebone-aleo-setup.sh | bash`

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/setup-systemd-service.sh | bash -s -- MINER_ADDRESS`

Next, run `sudo systemctl daemon-reload` to apply the updated service.

Finally, run `sudo systemctl start aleo.service`

## Monitoring

curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/amon.sh | bash -s -- NODE_IP_ADDRESS SECONDS_TO_RELOAD

- NODE_IP_ADDRESS: Your node ip address
- SECONDS_TO_RELOAD: Interval in seconds to refresh

For example:
`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/aleo/aleo/amon.sh | bash -s 10.11.12.13 10`

It means monitoring node address `10.11.12.13` for every `10` seconds
