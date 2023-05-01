#!/bin/bash

# Install wget
sudo yum -y install wget

# Download geth and extract to home directory
wget https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.10.11-7231b3ef.tar.gz
mkdir ~/geth-home
tar -zxvf geth-alltools-linux-amd64-1.10.11-7231b3ef.tar.gz -C ~/geth-home --strip-components 1

# Set PATH environment variable
echo 'export PATH=$HOME/geth-home:$PATH' >> ~/.bashrc
export PATH=$HOME/geth-home:$PATH

# Create genesis file
echo '{
  "config": {
    "chainId": 30888,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "777F0Ea767Fc7c767327Dcd2946cdC4a6f537948": { "balance": "900000000000000000000000" },
    "891F4717CebEB1DEf07717d862113DD982195908": { "balance": "900000000000000000000000" },
    "94F6cda8A1563e44792c185f25371d09ff04c96d": { "balance": "900000000000000000000000" }
  }
}' > ~/genesis.json

# Initialize geth with genesis file
geth init --datadir ~/geth-home/data ~/genesis.json



# Install screen
sudo yum -y install screen


# Install screen
sudo screen

# Start geth node with HTTP and WebSocket interfaces
curl -O https://github.com/ysyj0531/admin/blob/main/geth-start.sh && chmod +x geth-start.sh && ./geth-start.sh


