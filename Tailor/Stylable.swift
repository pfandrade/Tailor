//
//  Stylable.swift
//  Tailor
//  
//  Created on 16/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

import Foundation

public protocol Stylable {
}

extension Stylable {
    public func apply<T: Theme>(style: Style<Self, T>, theme: T) {
        style.apply(to: self, theme: theme)
    }

}

#if os(iOS) || os(watchOS) || os(tvOS)

import UIKit
extension UIView: Stylable {}

#elseif os(OSX)

import AppKit
extension NSView: Stylable {}

#endif
