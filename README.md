storm-emulab
============

Use these scripts to deploy storm on emulab

## Installing the storm dependencies
* ./setup.sh
* ./init.sh (to download storm and run zookeeper on master node)

## Running storm processes
* ./storm-start (will run the init.sh on all other nodes)

## Killing storm processes
* ./storm-kill (will kill the storm cluster)
