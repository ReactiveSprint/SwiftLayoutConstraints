//
//  LayoutConstraintType.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

/// Represents one side of a `LayoutConstraint.`
public protocol LayoutConstraintType {
    associatedtype Value
    var object: Value { get }
    var attribute: NSLayoutAttribute { get }
    
    /// Initialize an instance with `object` and `.NotAnAttribute`
    init(_ object: Value)
    
    /// Initializes an instance with `object` and `attribute`
    init(_ object: Value, attribute: NSLayoutAttribute)
}

extension LayoutConstraintType {
    public init(_ object: Value) {
        self.init(object, attribute: .NotAnAttribute)
    }
}
