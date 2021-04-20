#!/bin/sh
sudo apt-get install -y git make build-essential cmake

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source ~/.profile

# Install snarkos
cargo install snarkos
