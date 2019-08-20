//
//  Style.swift
//  Tailor
//
//  Created on 16/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

import Foundation

public struct Style<V, T: Theme> {
    private let style: (V, T) -> Void
    
    public init(_ style: @escaping (V, T) -> Void) {
        self.style = style
    }
    
    public func apply(to view: V, theme: T) {
        style(view, theme)
    }
}
