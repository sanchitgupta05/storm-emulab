#!/bin/bash
#
# Setup script to bootstrap

# download deps
#create a directory for deps

sudo mkdir /proj/DCSQ/exp/storm/deps/
cd /proj/DCSQ/exp/storm/deps/
sudo chmod -R 0777 ./

#download zeromq and install it
sudo wget http://download.zeromq.org/zeromq-4.0.3.tar.gz
sudo tar -xfz zeromq-4.0.3.tar.gz
sudo cd /proj/DCSQ/exp/storm/deps/zeromq-4.0.3/
sudo ./autogen.sh && ./configure && make -j4
sudo make install


#Download JZMQ and install #it
cd /proj/DCSQ/exp/storm/deps/
mkdir jzmq
cd jzmq
git init
git pull https://github.com/zeromq/jzmq master
./autogen.sh
./configure
sudo make
sudo make install

#Downlad Zookeeper and install it
cd /proj/DCSQ/exp/storm/deps
sudo wget http://supergsego.com/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
sudo tar -xfz zookeeper-3.4.6.tar.gz
sudo cd zookeeper-3.4.6/
#install the config in /zookeeper-3.4.6/conf/zoo.cfg ...


