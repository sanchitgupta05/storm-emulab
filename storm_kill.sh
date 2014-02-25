#!/bin/bash
#
# Kill all live storm processes.

for i in `seq 1 2`;
do
    ssh hosts-$i "pkill -f backtype.storm"
done

exit 0
