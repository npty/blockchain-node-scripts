#!/bin/sh
sudo apt-get install -y git make build-essential cmake clang libssl-dev pkg-config jq

# Install Rust
if ! command -v cargo &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

source $HOME/.cargo/env

# Install snarkos
cd $HOME/work

if [ ! -d $HOME/work/snarkOS ]; then
  git clone https://github.com/AleoHQ/snarkOS
fi
cd $HOME/work/snarkOS
git pull origin master
latest_tag=$(curl --silent "https://api.github.com/repos/AleoHQ/snarkOS/releases/latest" | jq -r .tag_name)
echo "Checkout version: $latest_tag"
git checkout ${latest_tag}

# Build binary
sudo chown -R $(whoami) $HOME/.cargo/
cargo build --release --verbose
