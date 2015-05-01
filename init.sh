#!/bin/bash
#
# This script setups storm's dependencies, needs to be run in all hosts.

MASTER_NODE="hosts-1.storm.dcsq.emulab.net"
REPO_DIR="/proj/DCSQ/exp/storm/storm-emulab/"

sudo apt-get update
sudo apt-get install -y openjdk-7-jre openjdk-7-jdk build-essential pkg-config libtool zookeeper zookeeper-bin supervisor maven2 unzip

#Download Storm and configure it
# Storm lives in the tmp folded

sudo chown -R `whoami` /usr/local/storm

### Download Storm and create $STORM_HOME = /usr/local/storm

#cd /tmp
#wget http://apache.arvixe.com/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz 
#cd /usr/local/
#sudo tar -xzf /tmp/apache-storm-0.9.4.tar.gz
#sudo chown -R sgupta51 apache-storm-0.9.4.tar.gz
#sudo ln -s apache-storm-0.9.4 storm

sudo mkdir /tmp/storm/logs/ -p

sudo cp $REPO_DIR/emulab.yaml REPO_DIR/../storm/conf/storm.yaml
#echo -e "    name: \"`hostname`\"" >> /tmp/storm/conf/storm.yaml

# Start supervisord
sudo pkill supervisord
echo `hostname`
if [ `hostname` = $MASTER_NODE ];
then
    sudo cp $REPO_DIR/supervisord_master.conf /etc/supervisor/supervisord.conf
    cd /proj/DCSQ/exp/storm/deps/zookeeper-3.4.6/
    sudo ./bin/zkServer.sh start
else
    sudo cp $REPO_DIR/supervisord_slave.conf /etc/supervisor/supervisord.conf
fi

sudo service supervisor restart

