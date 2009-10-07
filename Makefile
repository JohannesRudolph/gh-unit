TEST_TARGET=Tests
TEST_SDK=iphonesimulator3.0
COMMAND=xcodebuild -project src/GHUnit.xcodeproj
default:
	# Set default make action here

# If you need to clean a specific target/configuration: $(COMMAND) -target $(TARGET) -configuration DebugOrRelease -sdk $(SDK) clean
clean:
	-rm -rf build/*
iphone:
	$(COMMAND) -target GHUnitIPhoneRedist -configuration Release
mac:
	$(COMMAND) -target GHUnitRedist -configuration Release
test:
	GHUNIT_CLI=1 $(COMMAND) -target $(TEST_TARGET) -configuration Debug -sdk $(TEST_SDK) build
