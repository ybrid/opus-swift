//
// opus_swiftPlatformTests.swift
// opus-swift
//
// Copyright (c) 2021 nacamar GmbH - Ybrid®, a Hybrid Dynamic Live Audio Technology
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest
import YbridOpus

class opus_swiftPlatformTests: XCTestCase {

    func testOpusVersionString() throws {
        let versionString = String(cString: opus_get_version_string())
        print("-- opus_get_version_string() returns '\(versionString)\'")
        XCTAssertTrue(versionString.hasPrefix("libopus 1.3.1"))
    }
    
    
    func testBundleInfo() throws {
        let opusBundleIdentifier = "io.ybrid.opus-swift"
        
        guard let bundle = Bundle(identifier: opusBundleIdentifier) else {
            XCTFail("no bundle identifier '\(opusBundleIdentifier)' found")
            return
        }
        guard let info = bundle.infoDictionary else {
            XCTFail("no infoDictionary on bundle '\(opusBundleIdentifier)' found")
            return
        }
        print("-- infoDictionary is '\(info)'")
        
        let version = info["CFBundleShortVersionString"]
        XCTAssertNotNil(version)
        let name = info["CFBundleName"] as! String
        XCTAssertEqual("YbridOpus", name)
        let copyright = info["NSHumanReadableCopyright"] as! String
        XCTAssertTrue(copyright.contains("nacamar"))
    }
}
