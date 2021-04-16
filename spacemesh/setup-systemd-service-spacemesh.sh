#!/bin/sh

echo "Setting up systemd service..."

while getopts ":w" opt; do
  case ${opt} in
  w)
    public_key=$OPTARG
    ;;
  \?)
    echo "Invalid Option: -$OPTARG" 1>&2
    exit 1
    ;;
  :)
    echo "Invalid Option: -$OPTARG requires an argument" 1>&2
    exit 1
    ;;
  esac
done

sudo adduser spacemesh_service --system --no-create-home 2>/dev/null
sudo mkdir -p /var/lib/spacemesh-data
sudo mkdir -p /etc/spacemesh
if [ ! -f "/etc/spacemesh/spacemesh-service.env" ]; then
  sudo bash -c 'echo "PUBLIC_KEY=$public_key" >/etc/spacemesh/spacemesh-service.env'
fi
sudo chown -R spacemesh_service /var/lib/spacemesh-data
sudo cp $(find /home -type d -name 'go-spacemesh' | head -n 1)/build/go-spacemesh /var/lib/spacemesh-data
sudo curl https://discover.spacemesh.io/conf/28/config.json --output /var/lib/spacemesh-data/config.json
sudo curl https://raw.githubusercontent.com/npty/blockchain-node-scripts/master/spacemesh/spacemesh.service --output /etc/systemd/system/spacemesh.service

echo "Moonbeam systemd service has been setup successfully."
