#!/bin/sh

# If we aren't running from the command line, then exit
if [ "$GHUNIT_CLI" = "" ]; then
  exit 0
fi

export DYLD_ROOT_PATH="$SDKROOT"
export DYLD_FRAMEWORK_PATH="$CONFIGURATION_BUILD_DIR"
export IPHONE_SIMULATOR_ROOT="$SDKROOT"

export MallocScribble=YES
export MallocPreScribble=YES
export MallocGuardEdges=YES
export MallocStackLogging=YES
export MallocStackLoggingNoCompact=YES

export NSDebugEnabled=YES
export NSZombieEnabled=YES
export NSDeallocateZombies=NO
export NSHangOnUncaughtException=YES
export NSAutoreleaseFreedObjectCheckEnabled=YES

"$TARGET_BUILD_DIR/$EXECUTABLE_PATH" -RegisterForSystemEvents
RETVAL=$?

if [ -n "$WRITE_JUNIT_XML" ]; then
  USER_TMP_DIR="${TMPDIR}test-results"  
  APP_PATH=`ls -1td $USER_LIBRARY_DIR/Application\ Support/iPhone\ Simulator/User/Applications/*/$FULL_PRODUCT_NAME`
  APP_DIR=`dirname "$APP_PATH"`
  APP_TMP_DIR="$APP_DIR/tmp/test-results"
  
  if [ -d "$USER_TMP_DIR" ]; then
	`$CP -r "$USER_TMP_DIR" "$BUILD_DIR" && rm -r "$USER_TMP_DIR"`
	
  elif [ -d "$APP_TMP_DIR" ]; then
	`$CP -r "$APP_TMP_DIR" "$BUILD_DIR" && rm -r "$APP_TMP_DIR"`
  fi
fi

exit $RETVAL
	


