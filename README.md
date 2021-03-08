# opus-swift
A swift wrapper to use the [Opus Interactive Audio Codec](https://opus-codec.org/) libopus API. 

Intension of this project is to support [audio player SDK](https://github.com/ybrid/player-sdk-swift) with a platform independend XCFramework that can be integrated in swift projects via CocoaPod.

After integration just ```import YbridOpus``` in your Swift code. 

It supports iOS devices and simulators (version 9 to 14) and macOS (versions 10.10 to 11.1)

# Versions
We support version 1.3.1 of [libopus API](https://opus-codec.org/docs/opus_api-1.3.1).

# How to release a new version
A new version of the xcframework can be created and released in the following way.

## requirements
XCode, CocoaPods and Git are installed on your system.

The private pods repository is on your cocoa installation. Check this with ```pod repo```, if not execute
```pod repo add Private-Cocoapods git@github.com:ybrid/Private-Cocoapods.git``` 

Git clone/pull this project onto your system.

## Preparation: static libraries
Ensure the libraries ```./opus/libs/libopus_*.a``` are up to date. If not, check the preconditions described in script ```./prepare.sh``` and create new ones.

## Part 1: generate an XCFramework
1. In a terminal execute  ```./build.sh```
in the root of the project. It updates YbridOpus.xcframework.

## Part 2. release a new Version
1. In the root directory execute ```./pod_check.sh```. Repair errors if neccessary.
2. Alter the version number in ```YbridOpus.podspec```'s source line
3. git commit everything
4. Create a git tag with the exact name mentioned
5. ```git push --tags``` everything
6. execute ```./pod_push.sh``` and stay ready to input your password several times

The new version should be visible in [Private-Cocoapods](https://github.com/ybrid/Private-Cocoapods).

# Licenses
This project is under MIT license. We created the opus binaries for iOS and macOS from [opus sources of version 1.3.1](https://opus-codec.org/release/stable/2019/04/12/libopus-1_3_1.html). Opus is freely licensed under BSD, see the [LICENSE](https://github.com/ybrid/opus-swift/blob/master/LICENSE) file.