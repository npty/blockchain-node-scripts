#!/bin/bash
exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
        echo ''
else
  sudo apt install curl -y < "/dev/null"
fi
sudo apt update
sudo apt upgrade -y

echo -e '\n\e[42mInstall dependencies\e[0m\n' && sleep 1
sudo apt install make clang pkg-config libssl-dev build-essential git curl ntp jq llvm -y < "/dev/null"

#install rust
sudo curl https://sh.rustup.rs -sSf | sh -s -- -y
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

#install wallet
git clone https://github.com/AleoHQ/aleo && cd aleo
cargo install --path .

cd $HOME

#install snark
git clone https://github.com/AleoHQ/snarkOS && cd snarkOS
cargo build --release