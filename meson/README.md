## Setup Node

## Setup systemd service

`curl -s https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/setup-systemd-service.sh | bash -s -- 12000`

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
