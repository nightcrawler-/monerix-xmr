# Monero

## nanominer

Preferred:

wget https://github.com/nanopool/nanominer/releases/download/3.3.4/nanominer-linux-3.3.4.tar.gz

tar xvfz [the file]

then in config.ini, add the below

```
[RandomX]
wallet = 42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa
rigName = AZONE
email = [kenye unataka]
sortPools=true
```

### Download, install and run - with one script.
Use your own configuration in the script files - `warp.sh`

The conservative version that uses one less core: 

`wget -O - https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/warp.sh | bash`

The x-mode version that takes all cores:

`wget -O - https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/warp-unlimited.sh | bash`

The super conservertive version that disables 2 cores:

`wget -O - https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/warp-mini.sh | bash`

The x-mode, with the most recent commit:

`wget -O - https://raw.githubusercontent.com/nightcrawler-/monerix-xmr/master/warp-unlimited.sh | bash`


### XMRRIg with MoneroOcean

`curl -s -L https://github.com/nightcrawler-/monerix-xmr/releases/download/v0.0.1/monero_ocean.sh | bash -s 42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa`

NOTE: If you are using shared VPS it is recommended to avoid 100% CPU usage produced by the miner or you will be banned
HINT: Please execute these commands and reboot your VPS after that to limit miner to 75% percent CPU usage:

`sed -i 's/"max-threads-hint": *[^,]*,/"max-threads-hint": 75,/' $HOME/moneroocean/config.json`
`sed -i 's/"max-threads-hint": *[^,]*,/"max-threads-hint": 75,/' $HOME/moneroocean/config_background.json`


## Using xmr-stak

POOL Address:: xmr-eu2.nanopool.org:14444

POOL Address other xmr-us-east1.nanopool.org:14444

Wallet Address: 42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa


wget https://github.com/fireice-uk/xmr-stak/releases/download/1.0.5-rx/xmr-stak-rx-linux-1.0.5-cpu.tar.xz

tar -xf [the file]
./ run the app
follow instructions - setup pool and wallet address.
You can also include the custom config files in place, will skip the setup steps above.
Only uses about half of the available cores? But alot of memory, at least on the local tested on 

### To run in the background:

>> ctr + Z
>> bg


[config file changes:]
"daemon_mode" = true
"output_file" = "/tmp/xmr-stak.log"

then run `nohup ./xmr-stak &`

Resources:
https://xmr.nanopool.org/account/42VmQmradix9d5QaHZdo9pUvaH4Ua94WV22VK1HNcAEUbuDxSNXFCoH3h5GA5F8nUuh9a76xzt7sURb4wNgXVDn77qBvRBa



