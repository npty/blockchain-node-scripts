#!/bin/sh
sudo apt-get install -y git make build-essential cmake clang libssl-dev pkg-config

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source $HOME/.cargo/env

# Install snarkos
cd work
git clone https://github.com/AleoHQ/snarkOS
cd snarkOS
latest_tag=$(git describe --tags)
echo "Checkout version $latest_tag"
git checkout ${latest_tag}

# Build binary
cargo build --release --verbose
