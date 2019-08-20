//
//  TestModel.swift
//  TailorTests
//  
//  Created on 17/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

import Foundation
import Tailor

// Theme

struct TestTheme: Theme {
    @ObservableTheme
    static var current = TestTheme()

    var title = "Test title"
}

// Styles

extension Style where V: TestSubject, T == TestTheme {
    static var testStyle: Style {
        return Style { (s, theme) in
            s.title = theme.title
        }
    }
}

// Style subject

@objc class TestSubject: NSObject, Stylable {
    @objc var title = ""
}


// ObjC support

extension TestSubject {
    @objc func applyTestStyle() {
        self.apply(style: .testStyle, theme: TestTheme.current)
    }
}

@objc class ThemeObserver: NSObject {
    
    @objc class func observe(_ block: @escaping () -> Void) -> AnyObject {
        return TestTheme.$current.observe { (_, _) in
            block()
        }
    }
    
    
    @objc class func switchToTheme(titled: String) {
        var t2 = TestTheme()
        t2.title = titled
        TestTheme.current = t2
    }
}
