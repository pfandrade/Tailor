//
//  TailorTests.swift
//  TailorTests
//
//  Created on 16/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

import XCTest
import Tailor

class TailorTests: XCTestCase {

    func testApplyingStyle() {
        
        let subject = TestSubject()
        TestTheme.current.apply(style: .testStyle, to: subject)
        
        XCTAssertEqual(subject.title, TestTheme.current.title)
    }


    func testSwitchingThemes() {
        
        let subject = TestSubject()
        var observer: AnyObject? = TestTheme.$current.observe { (old, theme) in
            subject.apply(style: .testStyle, theme: theme)
        }
        
        XCTAssertNotNil(observer)
        
        XCTAssertEqual(subject.title, TestTheme.current.title)
        
        // switch themes
        var t2 = TestTheme()
        t2.title = "Another title"
        TestTheme.current = t2
        
        // our subject's title should have changed
        XCTAssertEqual(subject.title, t2.title)
        
        // stop observing
        observer = nil
        
        // switch theme again
        var t3 = t2
        t3.title = "Yet Another title"
        TestTheme.current = t3
        
        // our subject's title should not have changed
        XCTAssertEqual(subject.title, t2.title)
        XCTAssertNotEqual(subject.title, t3.title)
    }
}
