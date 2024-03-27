PLATFORM="platform=iOS Simulator,name=iPhone 8"
SDK="iphonesimulator"
SHELL=/bin/bash -o pipefail
XCODE_MAJOR_VERSION=$(shell xcodebuild -version | HEAD -n 1 | sed -E 's/Xcode ([0-9]+).*/\1/')

.PHONY: all cocoapods test analyze carthage spm

bazel:
	bazelisk build :PINOperation

test:
	xcodebuild clean test -destination ${PLATFORM} -sdk ${SDK} -project PINOperation.xcodeproj -scheme PINOperation \
	ONLY_ACTIVE_ARCH=NO \
	CODE_SIGNING_REQUIRED=NO | xcpretty
