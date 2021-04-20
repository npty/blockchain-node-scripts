sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/meson.service --output /etc/systemd/system/meson.service
sudo systemctl enable meson.service
sudo systemctl start meson.service
sudo watch systemctl status meson.service