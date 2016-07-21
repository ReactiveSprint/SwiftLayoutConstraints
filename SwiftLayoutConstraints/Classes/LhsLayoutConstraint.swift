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
    
    public init<L : LayoutConstraintType>(_ object: Value, constraint: L) {
        self.object = object
        self.attribute = constraint.attribute
    }
}

public extension LhsLayoutConstraint {
    public var constant: CGFloat { return DefaultConsant }
    public var multiplier: CGFloat { return DefaultMultiplier }
}
