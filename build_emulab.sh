#!/bin/bash
#
# Build storm project and copy the config file inside.

STORM_DIR="/home/raijin/files/projects/storm/"

bash ./bin/build_release.sh
unzip ./storm-0.9.0.1.zip
cp ./scripts/emulab.yaml ./storm-0.9.0.1/conf/
