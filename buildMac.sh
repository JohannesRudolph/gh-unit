#!/bin/sh

# buildMac.sh
# GHUnit
#
# Created by Johannes Rudolph on 07.10.09.
# Copyright 2009 __MyCompanyName__. All rights reserved.

#!/bin/sh

# build.sh
# GHUnitIPhone
#
# Created by Johannes Rudolph on 04.10.09.
# Copyright 2009 __MyCompanyName__. All rights reserved.

# build Simulator and OS versions of GHUnit

# Should define IPHONE_OS_VERSION 2.0,2.2.1,3.0
xcodebuild -target GHUnit -configuration ${BUILD_STYLE} 

# check for root build dir
if [ ! -d ../build/ ]; then
	mkdir ../build/
fi

cp -R ${BUILD_DIR}/${BUILD_STYLE}/GHUnit.framework ../build


