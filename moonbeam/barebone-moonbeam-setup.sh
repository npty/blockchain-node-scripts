sudo apt-get install -y git
git clone https://github.com/PureStake/moonbeam

cd moonbeam
latest_tag=$(git describe --tags)
git checkout ${latest_tag}

curl https://getsubstrate.io -sSf | bash -s -- --fast

./scripts/init.sh

source $HOME/.cargo/env

cargo build --release
