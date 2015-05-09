#!/bin/bash
#
# This script setups storm's dependencies, needs to be run in all hosts.

MASTER_NODE="hosts-1.storm.dcsq.emulab.net"
REPO_DIR="/proj/DCSQ/exp/storm/storm-emulab/"
STORM_DIR="/tmp/storm"
ZOOKEEPER_DIR="/proj/DCSQ/exp/storm/deps/zookeeper-3.4.6/"

sudo apt-get update
sudo apt-get install -y openjdk-7-jre openjdk-7-jdk build-essential pkg-config libtool zookeeper zookeeper-bin supervisor maven2 unzip


### Download Storm and create $STORM_HOME = /tmp/storm
cd /tmp

#sudo wget http://apache.arvixe.com/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz 
#sudo tar -xzf /tmp/apache-storm-0.9.4.tar.gz
#sudo chown -R `whoami` apache-storm-0.9.4
#sudo ln -s apache-storm-0.9.4 storm

sudo wget https://dl.dropboxusercontent.com/u/17354842/apache-storm-0.10.0-SNAPSHOT.tar.gz
sudo tar -xzf /tmp/apache-storm-0.10.0-SNAPSHOT.tar.gz
sudo chown -R `whoami` apache-storm-0.10.0-SNAPSHOT
sudo ln -s apache-storm-0.10.0-SNAPSHOT storm

#permission setting
sudo mkdir $STORM_DIR/logs/ -p
sudo chmod -R 0777 /tmp/storm
cd /logs && touch nimbus.log supervisor.log 

#supervisord logs
sudo mkdir -p /var/log/storm
sudo chown -R `whoami` /var/log/storm
sudo chmod -R 0777 /var/log/storm

#get the yaml file from $REPO_DIR
sudo cp $REPO_DIR/emulab.yaml $STORM_DIR/conf/storm.yaml

#Supervisor scheduler meta information: will be used later
#echo -e "    name: \"`hostname`\"" >> /tmp/storm/conf/storm.yaml

# Start supervisord
sudo pkill supervisord
if [ `hostname` = $MASTER_NODE ];
then
    sudo cp $REPO_DIR/supervisord_master.conf /etc/supervisor/supervisord.conf
    sudo $ZOOKEEPER_DIR/bin/zkServer.sh start
else
    sudo cp $REPO_DIR/supervisord_slave.conf /etc/supervisor/supervisord.conf
fi

#start all the dependants of this supervisord
sudo service supervisor start

