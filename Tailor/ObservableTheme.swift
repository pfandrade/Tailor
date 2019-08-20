//
//  SwitchableTheme.swift
//  Tailor
//  
//  Created on 16/08/2019.
//  Copyright © 2019 Paulo Andrade. All rights reserved.
//

import Foundation

@propertyWrapper
public class ObservableTheme<T: Theme> {
    public var wrappedValue: T {
        didSet {
            observers.forEach { (_, changeHandler) in
                changeHandler(oldValue, wrappedValue)
            }
        }
    }
    public var projectedValue: ObservableTheme<T> { self }
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public typealias ChangeHandler = (T?, T) -> Void
    
    private var sequence = (1...).makeIterator()
    private var observers: [Int: ChangeHandler] = [:]
    
    private class Observer: NSObject {
        private let dispose: () -> Void
        
        fileprivate init(dispose: @escaping () -> Void) {
            self.dispose = dispose
        }
        
        deinit {
            self.dispose()
        }
    }
    
    public func observe(_ handler: @escaping ChangeHandler) -> AnyObject {
        let next = sequence.next()!
        observers[next] = handler
        handler(nil, wrappedValue)
        return Observer {
            self.observers[next] = nil
        }
    }
}
