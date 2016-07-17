//
//  LhsLayoutConstraint.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

/// Left handside of a `LayoutConstraint.`
public struct LhsLayoutConstraint<Value: AnyObject>: LayoutConstraintType {
    public let object: Value
    public var attribute: NSLayoutAttribute
    
    public init(_ object: Value, attribute: NSLayoutAttribute) {
        self.object = object
        self.attribute = attribute
    }
    
    public init<L : LayoutConstraintType where L.Value == Value>(_ object: Value, constraint: L) {
        self.object = object
        self.attribute = constraint.attribute
    }
}

public extension LhsLayoutConstraint {
    var constant: CGFloat { return 0 }
    var multiplier: CGFloat { return 1 }
}
