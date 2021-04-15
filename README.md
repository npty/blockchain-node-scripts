# Blockchain Node Scripts

This repo contains a set of shell scripts to run nodes for supported project.

These features are supported:

- Create the Google Cloud Compute Engine instance which matched with system requirement of the project
- Create the firewall rule for the instance to allow required ports.
- Install dependencies, setup environment variables, clone the project and build a binary.
- Create a systemd service so you can disconnect without stopping the node.
- Run and enjoy 🚀

The tool is made to supported people interested to run node quickly without having to read the project documentation.

Unfortunately, I'm not expected to maintain it in the long run especially when my interests drops.

So if that happens and you want to continue the development, don't hesitate to fork it and contact [me](nptytn2@gmail.com) to put a link to your forked project in README.

Enjoys 🙂

The supported projects are:

- [Moonbeam](https://github.com/npty/blockchain-node-scripts/moonbeam)
- [Spacemesh](https://github.com/npty/blockchain-node-scripts/spacemesh)

# License

    Copyright 2021 nopantytonight ✨

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
