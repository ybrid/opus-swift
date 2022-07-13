#!/bin/sh

# MIT License

# Copyright (c) 2021 Ybrid®, a Hybrid Dynamic Live Audio Technology

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#
# Generates opus_swift.xcframework from opus.xcodeproj.
# Usage: no parameters, settings mostly defined in xcode project
#

opts="SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES"

dd=./DerivedData
archivesPath="$dd/Archives"
generatedPath="Products/Library/Frameworks"

# path and name of intermediatly built frameworks
builtPath="$dd/Build/Products"
framework=YbridOpus.framework

rm -rfd $dd
mkdir -p "$archivesPath"
mkdir -p "$builtPath"

pj="-project opus-swift.xcodeproj"

platform=iphoneos
scheme=opus_ios
echo "building for $platform..."
xcodebuild archive $pj -scheme $scheme -destination="iOS" -sdk $platform -derivedDataPath $dd \
    -archivePath "$archivesPath/$platform.xcarchive" $opts > "build-$platform.log"
cp -R "$archivesPath/$platform.xcarchive/$generatedPath" "$builtPath/Archive-$platform"

platform=iphonesimulator
scheme=opus_ios_sim
echo "building for $platform..."
xcodebuild archive $pj -scheme $scheme -destination="iOS Simulator" -sdk $platform -derivedDataPath $dd \
    -archivePath "$archivesPath/$platform.xcarchive" $opts > "build-$platform.log"
cp -R "$archivesPath/$platform.xcarchive/$generatedPath" "$builtPath/Archive-$platform"

# Mac Catalyst needs Xcode >= 11.0
platform=maccatalyst
scheme=opus_catalyst
echo "building for $platform..."
#-sdk macosx ?
xcodebuild archive $pj -scheme $scheme -archs="x86_64h" -destination "generic/platform=macOS,variant=Mac Catalyst,name=Any Mac" -derivedDataPath $dd \
    -archivePath "$archivesPath/$platform.xcarchive" $opts > "build-$platform.log"
cp -R "$archivesPath/$platform.xcarchive/$generatedPath" "$builtPath/Archive-$platform"

platform=macosx
scheme=opus_macos
echo "building for $platform..."
xcodebuild archive $pj -scheme $scheme -destination='My Mac' -sdk $platform -derivedDataPath $dd \
    -archivePath "$archivesPath/$platform.xcarchive" $opts > "build-$platform.log"
cp -R "$archivesPath/$platform.xcarchive/$generatedPath" "$builtPath/Archive-$platform"

# name of final xcframework
xcframework=YbridOpus.xcframework
rm -rfd $xcframework

products=`ls $builtPath`
echo "generating $xcframework for \n$products\n..."

cmd="xcodebuild -quiet -create-xcframework "
for entry in $products; do
    cmd="$cmd -framework $builtPath/$entry/$framework "
done
cmd="$cmd -output $xcframework"
echo "$cmd"
$cmd

echo "zip $xcframework including LICENSE file..."
cp LICENSE $xcframework
zip -q -r $xcframework.zip $xcframework
echo "done."
