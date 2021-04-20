#!/bin/sh
sudo apt-get install -y git make build-essential cmake libssl-dev pkg-config

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source $HOME/.cargo/env

# Install snarkos
cargo install snarkos
