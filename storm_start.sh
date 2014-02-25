#!/bin/bash
#
# Start storm processes.

echo "Starting zookeeper..."
cd /proj/uiucnet/exp/storm/deps/zookeeper-3.4.5/
./bin/zkServer.sh start

echo "Starting nimbus..."
storm nimbus &

echo "Starting UI..."
storm ui &

for i in `seq 1 2`;
do
    echo "Starting supervisor ${i}..."
    ssh hosts-$i "/proj/uiucnet/exp/storm/storm/bin/storm supervisor &" &
done

exit 0
