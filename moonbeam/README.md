# Moonbeam Scripts

This repo provides a set of utility scripts for running Moonbeam's node.

| Requirement                                          | Passed |
| ---------------------------------------------------- | ------ |
| 8-cores-cpu-and-16-gb-ram-and-50GB-storage instance. | ✅     |
| Allow tcp 30333 and 30334 ports                      | ✅     |
| SSH into an instance                                 | ✅     |
| Stressfree                                           | ✅     |

## Prerequisite

### Step 1

Make sure you have `gcloud` cli installed.

If you don't have it, please follow installation step [here](https://cloud.google.com/sdk/docs/quickstart)

### Step 2

Initialize the cloud sdk, follow the steps [here](https://cloud.google.com/sdk/docs/quickstart#initializing_the)

At the end, you should have logged-in account and selected cloud project.

## Create Google Cloud Compute Instance

Run the command below

```
curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/master/moonbeam/create-gcloud-instance.sh \
    --output create-gcloud-instance.sh && \
    chmod +x create-gcloud-instance.sh && \
    ./create-gcloud-instance.sh -n YOUR_INSTANCE_NAME
```

> Note: Replace YOUR_INSTANCE_NAME with your desired name.

## Setup Moonbeam Node

This is basically put every commands [here](https://docs.moonbeam.network/getting-started/local-node/setting-up-a-node/) into one shell script file.

Run the following command to run all required steps:

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/master/moonbeam/barebone-moonbeam-setup.sh | bash`

## Setup systemd service

### Step 1: Prepare Environment Variables

Place the following content at /etc/moonbeam/moonbeam-service.env

```
PUBLIC_KEY=YOUR_ERC20_ADDRESS
NODE_NAME=YOUR_NODE_NAME
```

### Step 2: Setup systemd service

`curl -s https://raw.githubusercontent.com/npty/blockchain-node-scripts/master/moonbeam/setup-systemd-service.sh | bash`

## Run Moonbeam Node

```
sudo systemctl enable moonbeam.service
sudo systemctl start moonbeam.service
```

You can verify the service is running with:
`sudo systemctl status moonbeam.service`

You can also check the logs by executing:
`sudo journalctl -f -u moonbeam.service`

## Upgrade Moonbeam Node

`sudo systemctl stop moonbeam`

Then, rerun setup Moonbeam Node script.

Once it completed, run `sudo systemctl start moonbeam.service`
