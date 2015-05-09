#!/bin/bash
#
# Setup script to bootstrap

# download deps
#create a directory for deps

DEPS_DIR="/proj/DCSQ/exp/storm/deps/"
REPO_DIR="/proj/DCSQ/exp/storm/storm-emulab/"
STORM_DIR="/tmp/storm"
ZOOKEEPER_DIR="/proj/DCSQ/exp/storm/deps/zookeeper-3.4.6/"

sudo apt-get update
sudo apt-get install -y vim openjdk-7-jre openjdk-7-jdk build-essential pkg-config libtool zookeeper zookeeper-bin supervisor maven2 unzip

sudo mkdir $DEPS_DIR
cd $DEPS_DIR
sudo chmod -R 0777 $DEPS_DIR

#download zeromq and install it
sudo wget http://download.zeromq.org/zeromq-4.0.3.tar.gz
sudo tar -xzf zeromq-4.0.3.tar.gz
sudo cd $DEPS_DIR/zeromq-4.0.3/
sudo ./autogen.sh
sudo ./configure && sudo make && sudo make install


#Download JZMQ and install #it
cd $DEPS_DIR
sudo mkdir jzmq
cd jzmq
sudo git init
sudo git pull https://github.com/zeromq/jzmq master
sudo ./autogen.sh
sudo ./configure && sudo make && sudo make install

#Downlad Zookeeper and install it
cd $DEPS_DIR
sudo wget http://supergsego.com/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
sudo tar -xzf zookeeper-3.4.6.tar.gz
cd zookeeper-3.4.6/
#install the config in /zookeeper-3.4.6/conf/zoo.cfg ...
sudo cp $REPO_DIR/zoo.cfg $ZOOKEEPER_DIR/conf/zoo.cfg


