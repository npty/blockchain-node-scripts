sudo apt-get install -y wget
sudo wget 'https://assets.meson.network:10443/static/terminal/v2.0.2/meson-linux-amd64.tar.gz'
sudo tar -zxf meson-linux-amd64.tar.gz
sudo rm -rf ~/meson-linux-amd64/config.txt
sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/config.txt --output ~/meson-linux-amd64
sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/meson.service --output /etc/systemd/system/meson.service
sudo systemctl enable meson.service
sudo systemctl start meson.service
sudo watch systemctl status meson.service