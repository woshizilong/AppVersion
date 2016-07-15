//
//  AppVersionTests.swift
//  AppVersionTests
//
//  Created by kaba on 16/7/15.
//  Copyright © 2016年 kaba. All rights reserved.
//

import XCTest
@testable import AppVersion

class AppVersionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitWithBundlePath(){
        let nilVersion:Version? = Version(bundlePath: "AppVersionTests.xctest")
        XCTAssertTrue(nilVersion == nil)
    }
    
    func testVersionEqual() {
        //等长
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0") == Version(versionStringWithDot: "1.0.0"))
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0") >= Version(versionStringWithDot: "1.0.0"))
        
        
        //左长
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0.0") == Version(versionStringWithDot: "1.0.0"))
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0.0") >= Version(versionStringWithDot: "1.0.0"))
        
        //右长
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0") == Version(versionStringWithDot: "1.0.0.0"))
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0") >= Version(versionStringWithDot: "1.0.0.0"))
    }
    
    func testVersionLessthan() {
        XCTAssertTrue(Version(versionStringWithDot: "1.0.1") > Version(versionStringWithDot: "1.0.0"))
        XCTAssertTrue(Version(versionStringWithDot: "1.0.0.1") > Version(versionStringWithDot: "1.0.0"))
        XCTAssertTrue(Version(versionStringWithDot: "1.0.10") > Version(versionStringWithDot: "1.0.2"))
    }

    
}
