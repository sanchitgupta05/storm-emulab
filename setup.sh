#!/bin/bash
#
# Setup script to bootstrap

wget http://download.zeromq.org/zeromq-4.0.3.tar.gz
./autogen.sh && ./configure && make -j4
