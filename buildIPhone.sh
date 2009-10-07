#!/bin/sh

# build.sh
# GHUnitIPhone
#
# Created by Johannes Rudolph on 04.10.09.
# Copyright 2009 __MyCompanyName__. All rights reserved.

# build Simulator and OS versions of GHUnit

# Should define IPHONE_OS_VERSION 2.0,2.2.1,3.0
xcodebuild -target GHUnitIPhone -configuration ${BUILD_STYLE} -sdk iphoneos${IPHONE_OS_VERSION} 
xcodebuild -target GHUnitIPhone -configuration ${BUILD_STYLE} -sdk iphonesimulator${IPHONE_OS_VERSION}

OUTPUT_DIR=build/Combined${BUILD_STYLE}${IPHONE_OS_VERSION}
OUTPUT_FILE=libGHUnitIPhone${IPHONE_OS_VERSION}.a

ZIP_DIR=${BUILD_DIR}/redist

if [ ! -d ${OUTPUT_DIR} ]; then
	mkdir ${OUTPUT_DIR}
fi

# Combine lib files
lipo -create "${BUILD_DIR}/${BUILD_STYLE}-iphoneos/libGHUnitIPhone${FLAVOR}.a" "${BUILD_DIR}/${BUILD_STYLE}-iphonesimulator/libGHUnitIPhone${FLAVOR}.a" -output ${OUTPUT_DIR}/${OUTPUT_FILE}

# Copy to direcory for zipping 
mkdir ${ZIP_DIR}
cp ${OUTPUT_DIR}/${OUTPUT_FILE} ${ZIP_DIR}
cp ${BUILD_DIR}/${BUILD_STYLE}-iphonesimulator/*.h ${ZIP_DIR}
cp ${BUILD_DIR}/${BUILD_STYLE}-iphonesimulator/*.m ${ZIP_DIR}
cp ${BUILD_DIR}/${BUILD_STYLE}-iphonesimulator/*.sh ${ZIP_DIR}

cd ${ZIP_DIR}
zip -m libGHUnitIPhone${FLAVOR}-${GHUNIT_VERSION}.zip *

if [ ! -d ../../../build/ ]; then
	mkdir ../../../build/
fi

cp libGHUnitIPhone${FLAVOR}-${GHUNIT_VERSION}.zip ../../../build/
rm -rf ${ZIP_DIR}
