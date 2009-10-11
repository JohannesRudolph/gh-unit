#!/bin/sh
# Run the unit tests in this test bundle.
export DYLD_FRAMEWORK_PATH="${TEMP_ROOT}/Frameworks"
"${SYSTEM_DEVELOPER_DIR}/Tools/RunUnitTests"

