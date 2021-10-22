# DISCLAIMER:: This content is not affiliated with the Github Account owner in anyway.
## Some lawyer lingo applies.

## Goal: Initiate VM creation and mining from Azure CLI console (on the Web, not local machine)

### Background:

1. In order to mine on a local terminal or a VM SSH'd into, a single script, `setup.sh` can be executed from the terminal. It downloads, extracts, configures and starts the `nanominer`
2. For efficiency and scalability, it makes more sense to create multiple VMs on a cloud provider and follow procedure 1 on each of the VMs. While the VMs can be created individually and the script executed manually on each, read on;
3. Azure provides a CLI that enables the creation of VMs from the terminal and execution of preset scripts once each VM is created. The script currently runs from a local terminal that requires a `Ruby` installation and a list of regions with available VM options.
4. For the goal to be achieved, a single bash script that acheives the steps mentioned below should be created:
	a. Can be executed once from a fresh Azure web console
	b. Downloads and installs `Ruby` with all relevant dependencies
	c. Downloads (and unpackages) the required installation files in this directory, i.e. files in `data` dir, `warp-h8.rb` and `warp.rb`.
	d. Runs `warp-h8.rb` and `warp.rb` in successive order (or parallel?)

Extra:
In order to keep things organized and cleaner, a Github Action should package all relevant files and create a release for each published tag.

Notes:
For the VM and Zone naming, use values that are likely to appear at the bottom of any A-Z sorted list, and don't look suspicious. :)

The packing/unpacking can be skipped as only a total of only 4 files are needed.

Thoughts::
Explore device tracking by the cloud vendors, possibly use a different setup for signup/subscription. Cookies, https headers, user agents? 

### Alt. Creation strategy

1. Use automated script above that pauses every x-hours after one VM creation
2. Write a script that will take in the region and machine type as parameters for creation and deployment of a single istance