# Spacemesh Scripts

This repo provides a set of utility scripts for running Spacemesh's node.

| Requirement                                          | Passed |
| ---------------------------------------------------- | ------ |
| 4-cores-cpu-and-8-gb-ram-and-350GB-storage instance. | ✅     |
| Allow tcp 7153 and udp 7153 ports                    | ✅     |
| SSH into an instance                                 | ✅     |
| Stressfree                                           | ✅     |

## Prerequisite

### Step 1

Make sure you have `gcloud` cli installed.

If you don't have it, please follow installation step [here](https://cloud.google.com/sdk/docs/quickstart)

### Step 2

Initialize the cloud sdk, follow the steps [here](https://cloud.google.com/sdk/docs/quickstart#initializing_the)

At the end, you should have logged-in account and selected cloud project.

## Create Google Cloud Compute Instance (Skip if you have your own instance)

Run the command below

```
curl https://raw.githubusercontent.com/npty/moonbeam-node-script/master/spacemesh/create-gcloud-instance.sh \
    --output create-gcloud-instance.sh && \
    chmod +x create-gcloud-instance.sh && \
    ./create-gcloud-instance.sh -n YOUR_INSTANCE_NAME
```

> Note: Replace YOUR_INSTANCE_NAME with your desired name.

## Setup Spacemesh Node

Run the following command to run all required steps:

`curl -s https://raw.githubusercontent.com/npty/moonbeam-node-script/master/spacemesh/barebone-spacemesh-setup.sh | bash`

`cd work/go-spacemesh/build`

```
sudo curl https://discover.spacemesh.io/conf/28/config.json --output config.json
```

Then you can try running go-spacemesh with

```bash
./go-spacemesh --tcp-port 7153 \
  --config ./config.json \
  -d ./sm_data
```

## Setup systemd service

`curl -s https://raw.githubusercontent.com/npty/moonbeam-node-script/master/spacemesh/setup-systemd-service-spacemesh.sh | bash -s YOUR_WALLET_ADDRESS`

## Run Spacemesh Systemd Service

Start the service

```
sudo systemctl enable spacemesh.service
sudo systemctl start spacemesh.service
```

Stop the service

```
sudo systemctl stop spacemesh.service
```

You can verify the service is running with:
`sudo systemctl status spacemesh.service`

You can also check the logs by executing:
`sudo journalctl -f -u spacemesh.service`
