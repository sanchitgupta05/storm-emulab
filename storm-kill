#!/bin/bash
#
# Kill all live storm processes.

NUM_HOSTS=3

for i in `seq 1 $NUM_HOSTS`;
do
    echo "Stopping supervisor ${i}..."
    ssh hosts-$i "sudo service supervisor stop"
done

exit 0
