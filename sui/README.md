# Moonbeam Scripts

This repo provides a set of utility scripts for running Moonbeam's node.

| Requirement                                         | Passed |
| --------------------------------------------------- | ------ |
| 2-cores-cpu-and-8-gb-ram-and-50GB-storage instance. | ✅     |
| Allow tcp 9000 and 9184 ports                       | ✅     |
| SSH into an instance                                | ✅     |
| Stressfree                                          | ✅     |

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
curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/master/sui/create-gcloud-instance.sh \
    --output create-gcloud-instance.sh && \
    chmod +x create-gcloud-instance.sh && \
    ./create-gcloud-instance.sh -n YOUR_INSTANCE_NAME
```
