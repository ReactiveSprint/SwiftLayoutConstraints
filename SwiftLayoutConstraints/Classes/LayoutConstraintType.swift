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
    var attribute: NSLayoutAttribute { get set }
    var constant: CGFloat { get }
    var multiplier: CGFloat { get }
    
    /// Initializes an instance with `object` and `attribute`
    init(_ object: Value, attribute: NSLayoutAttribute)
    
    /// Initializes an instance with `object` and other values from `constraint.`
    init<L: LayoutConstraintType>(_ object: Value, constraint: L)
}

public extension LayoutConstraintType {
    /// Initialize an instance with `object` and `.NotAnAttribute`
    public init(_ object: Value) {
        self.init(object, attribute: .NotAnAttribute)
    }
    
    /// Initializes an instance with values from `constraint.`
    public init<L: LayoutConstraintType where L.Value == Value>(constraint: L) {
        self.init(constraint.object, constraint: constraint)
    }
}
