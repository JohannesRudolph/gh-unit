#!/bin/sh
# Unpack frameworks required for this target
pushd "${TEMP_ROOT}"
if [ ! -d Frameworks ]; then
	mkdir Frameworks
fi
cd Frameworks
if [ ! -d  hamcrest.framework ]; then
    gnutar xjf "${PROJECT_DIR}/Frameworks/hamcrest.tar.bz2"
fi
popd

