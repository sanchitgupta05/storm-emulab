#!/bin/bash
#
# Setup script to bootstrap

# download deps
#create a directory for deps
mkdir /proj/DCSQ/exp/storm/deps/

cd /proj/DCSQ/exp/storm/deps/

#download zeromq and install it
wget http://download.zeromq.org/zeromq-4.0.3.tar.gz
tar -xfz zeromq-4.0.3.tar.gz
cd /proj/DCSQ/exp/storm/deps/zeromq-4.0.3/
./autogen.sh && ./configure && make -j4
sudo make install

#Download JZMQ and install it

cd /proj/DCSQ/exp/storm/deps/jzmq/
sudo make install

