#!/bin/bash
#
# Start storm processes.

NUM_HOSTS=3

echo "Starting zookeeper..."
cd /proj/uiucnet/exp/storm/deps/zookeeper-3.4.5/
sudo ./bin/zkServer.sh start

for i in `seq 1 $NUM_HOSTS`;
do
    echo "Starting supervisor ${i}..."
    ssh hosts-$i "sudo service supervisor start"
done

exit 0
