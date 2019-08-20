//
//  Theme.swift
//  Tailor
//
//  Created on 16/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

import Foundation

public protocol Theme {
    func apply<V>(style: Style<V, Self>, to view: V)
}

extension Theme {
    public func apply<V>(style: Style<V, Self>, to view: V) {
        style.apply(to: view, theme: self)
    }
}
