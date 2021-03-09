# opus-swift
A swift wrapper to use the [Opus Interactive Audio Codec](https://opus-codec.org/) libopus API. 

Intension of this project is to support [audio player SDK](https://github.com/ybrid/player-sdk-swift) with a platform independend XCFramework that can be integrated in swift projects via CocoaPod.

It supports iOS devices and simulators (version 9 to 14) and macOS (versions 10.10 to 11.2)

# Versions
We support version 1.3.1 of [libopus API](https://opus-codec.org/docs/opus_api-1.3.1).

# Integration 
After integration use 
```swift 
import YbridOpus
``` 
in your Swift code.

## If you use CocoaPods 
The Cocoa Podfile of a project using this framework, should look like
```ruby
platform :ios, '9.0'
target 'player-sdk-swift' do
  use_frameworks!
  source 'https://github.com/CocoaPods/Specs.git'
  pod 'YbridOpus'
end
```
## If you don't use CocoaPods
If you manage packages in another way you may download YbridOpus.xcframework.zip from [the latest release of this repository](https://github.com/ybrid/opus-swift/releases) and embed it into your own project manually. 

Unzip the file into a directory called 'Frameworks' of your XCode project. In the properties editor, drag and drop the directory into the section 'Frameworks, Libraries and Embedded Content' of the target's 'General' tab.

# Contributing
You are welcome to [contribute](https://github.com/ybrid/opus-swift/blob/master/CONTRIBUTING.md).

# Licenses
This project is under MIT license. We create the opus binaries for iOS and macOS from [opus sources of version 1.3.1](https://opus-codec.org/release/stable/2019/04/12/libopus-1_3_1.html). Opus is freely licensed under BSD, see the [LICENSE](https://github.com/ybrid/opus-swift/blob/master/LICENSE) file.