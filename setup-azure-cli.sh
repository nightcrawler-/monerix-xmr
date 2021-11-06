#!/bin/bash

VERSION=1.0.0

echo "Azure CLI Setup script version $VERSION."

# TODO: Check for Azure CLI and install if missing. This will still prompt user to sign in to their acc


# Check if ruby is installed, install if missing
if ! command -v ruby &> /dev/null
then
    echo "Ruby could not be found"
    echo "Installing Ruby"
    sudo apt-get install ruby-full
    # sudo snap install ruby --classic
    # exit
else 
	echo "Ruby is installed. Skipping"
fi

# Download required setup files.
# First, the regions data files

echo "Downloading data files.."

# H8 Regions file
wget -q https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/data/locations-h8.json

# F8 Regions file
wget -q https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/data/locations-f8.json

# Create a `data` dir and move all json files in current dir to it
mkdir data

mv *.json data

echo "Data files downloaded"

echo "Downloading and running warp-h8 setup scripts"

wget -q -O - https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/warp-h8.rb | ruby

echo "Completed downloading and running warp-h8 setup scripts"

echo "Downloading and running warp setup scripts"

wget -q -O - https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/warp.rb | ruby

echo "Completed downloading and running warp setup scripts"



