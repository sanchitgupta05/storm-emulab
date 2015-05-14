#!/bin/bash
#
# Cleanup across all machines

NUM_HOSTS=1

for i in `seq 1 $NUM_HOSTS`;
do
    echo "Cleanup in ${i}..."
    ssh hosts-$i "sudo supervisorctl stop all && cd /tmp && sudo rm -rf ./storm/ ./apache-storm-0.10.0-SNAPSHOT apache-storm-0.10.0-SNAPSHOT.tar.gz* storm"
done

exit 0
