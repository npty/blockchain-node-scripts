# Meson Scripts

| Requirement                                          | Passed |
| ---------------------------------------------------- | ------ |
| 2-cores-cpu-and-2-gb-ram-and-450GB-storage instance. | ✅     |
| Allow all ports                                      | ✅     |
| SSH into an instance                                 | ✅     |

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
curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/create-gcloud-instance.sh \
    --output create-gcloud-instance.sh && \
    chmod +x create-gcloud-instance.sh && \
    ./create-gcloud-instance.sh -n YOUR_INSTANCE_NAME
```

> Note: Replace YOUR_INSTANCE_NAME with your desired name.

## Setup systemd service

`curl -s https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/meson.sh | bash`
## Run Systemd Service

Start the service

```
sudo systemctl enable meson.service
sudo systemctl start meson.service
```

Stop the service

```
sudo systemctl stop meson.service
```

You can verify the service is running with:
`sudo systemctl status meson.service`

You can also check the logs by executing:
`sudo journalctl -f -u meson.service`
