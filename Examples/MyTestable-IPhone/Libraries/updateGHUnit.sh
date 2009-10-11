#!/bin/sh

# updateGHUnit.sh
# MyTestable
#
# Created by Johannes Rudolph on 11.10.09.
# Copyright 2009 __MyCompanyName__. All rights reserved.

cd ../../../	# go to project root
make iphone # build ghunit

# copy build output
cp build/*.zip Examples/MyTestable-IPhone/Libraries/GHUnit.zip

# go to example-project root
cd  Examples/MyTestable-IPhone/Libraries/
# clean old directory
rm -R GHUnit
mkdir GHUnit
# unzip new GHUnit files
unzip GHUnit.zip -d GHUnit/
# remove copy
rm GHUnit.zip