sudo adduser meson_service --system --no-create-home 2>/dev/null
sudo mkdir -p /var/lib/meson-data
sudo cd /var/lib/meson-data
sudo apt-get install -y wget
sudo wget 'https://assets.meson.network:10443/static/terminal/v2.0.2/meson-linux-amd64.tar.gz'
sudo tar -zxf meson-linux-amd64.tar.gz
sudo rm -rf /var/lib/spacemesh-data/meson-linux-amd64/config.txt
sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/config.txt --output /var/lib/meson-data/meson-linux-amd64/config.txt
sudo curl https://raw.githubusercontent.com/B6111427/blockchain-node-scripts/master/meson/meson.service --output /etc/systemd/system/meson.service
sudo systemctl enable meson.service
sudo systemctl start meson.service
sudo watch systemctl status meson.service