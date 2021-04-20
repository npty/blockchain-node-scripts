#!/bin/sh
sudo apt-get install -y git make unzip rsync

# # Install Go 1.16.3
go_file=go1.16.3.linux-amd64.tar.gz
curl -O "https://dl.google.com/go/$go_file"

# Verify binary checksum
go_chksum=$(sha256sum $go_file | awk '{print $1}')
if [[ "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2" == $go_chksum ]]; then
  echo "checksum is valid ✅"
else
  echo "checksum is invalid ❌"
  exit 1
fi

# Setting up go path
tar xvf $go_file
sudo chown -R root:root ./go
sudo mv go /usr/local

echo "export GOPATH=$HOME/work" >~/.profile
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/work/bin" >>~/.profile
source ~/.profile

# Build binary from source
mkdir work && cd work
git clone --depth 1 --branch v0.1.28 https://github.com/spacemeshos/go-spacemesh.git
cd go-spacemesh
make install && make build
cd build

## Part 2: Setup CLI Wallet
cd ~/work
git clone https://github.com/spacemeshos/cli-wallet.git
cd cli-wallet
go get && go build
make build-linux
