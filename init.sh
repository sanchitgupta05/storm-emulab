#!/bin/bash
#
# This script setups storm's dependencies, needs to be run in all hosts.

MASTER_NODE="hosts-1.storm.uiucnet.emulab.net"

sudo apt-get update
sudo apt-get install -y openjdk-7-jre openjdk-7-jdk build-essential pkg-config libtool zookeeper zookeeper-bin chkconfig supervisor maven2

cd /proj/uiucnet/exp/storm/deps/zeromq-4.0.3/
sudo make install

cd /proj/uiucnet/exp/storm/deps/jzmq/
sudo make install

sudo chown -R halkaff /tmp/storm
mkdir /tmp/storm/logs/ -p
mkdir /tmp/storm/conf/ -p
cp ./emulab.yaml /tmp/storm/conf/storm.yaml
echo -e "    name: \"`hostname`\"" >> /tmp/storm/conf/storm.yaml

# Start supervisord
sudo pkill supervisord
if [ `hostname` = $MASTER_NODE ];
then
    sudo cp supervisord_master.conf /etc/supervisor/supervisord.conf
    cd /proj/uiucnet/exp/storm/deps/zookeeper-3.4.5/
    sudo ./bin/zkServer.sh start
else
    sudo cp supervisord_slave.conf /etc/supervisor/supervisord.conf
fi
