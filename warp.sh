#!/bin/bash
wget https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/nanominer-linux-3.3.4.tar.xz
tar -xf nanominer-linux-3.3.4.tar.xz
cd nanominer-linux-3.3.4
nohup ./nanominer &