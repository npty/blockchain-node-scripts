# Spacemesh Scripts

This repo provides a set of utility scripts for running Spacemesh's node.

| Requirement                                          	| Passed 	|
|------------------------------------------------------	|--------	|
| 4-cores-cpu-and-8-gb-ram-and-350GB-storage instance. 	| ✅      |
| Allow tcp 7153 and udp 7153 ports                     | ✅      |
| SSH into an instance                                 	| ✅      |
| Stressfree                                           	| ✅      |

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
curl https://raw.githubusercontent.com/npty/moonbeam-node-script/spacemesh/create-gcloud-spacemesh-instance.sh \
    --output create-gcloud-spacemesh-instance.sh && \
    chmod +x create-gcloud-spacemesh-instance.sh && \
    ./create-gcloud-spacemesh-instance.sh -n YOUR_INSTANCE_NAME
```

> Note: Replace YOUR_INSTANCE_NAME with your desired name.

## Setup Moonbeam Node

Run the following command to run all required steps:

`curl -s https://raw.githubusercontent.com/npty/moonbeam-node-script/spacemesh/barebone-spacemesh-setup.sh | bash`

## Setup systemd service

### Step 1: Prepare Environment Variables

Place the following content at /etc/moonbeam/moonbeam-service.env

```
PUBLIC_KEY=YOUR_ERC20_ADDRESS
NODE_NAME=YOUR_NODE_NAME
```

### Step 2: Setup Systemd Services

> Coming soon

## Upgrade Moonbeam Node

`sudo systemctl stop moonbeam`

Then, rerun setup Moonbeam Node script.

Once it completed, run `sudo systemctl start moonbeam.service`

License
=======
    Copyright 2021 nopantytonight ✨

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
