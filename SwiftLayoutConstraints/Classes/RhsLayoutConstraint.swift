//
//  RhsLayoutConstraint.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

/// Right handside of a `LayoutConstraint.`
public struct RhsLayoutConstraint<V: AnyObject>: LayoutConstraintType {
    public let object: V?
    public var attribute: NSLayoutAttribute
    public var constant: CGFloat
    public var multiplier: CGFloat
    
    public init(_ object: V?, attribute: NSLayoutAttribute, constant: CGFloat, multiplier: CGFloat) {
        self.object = object
        self.attribute = attribute
        self.constant = constant
        self.multiplier = multiplier
    }
    
    public init<L :LayoutConstraintType>(_ object: V?, constraint: L) {
        self.object = object
        attribute = constraint.attribute
        constant = constraint.constant
        multiplier = constraint.multiplier
    }
}

public extension RhsLayoutConstraint {
    public init<L :LayoutConstraintType where L.Value == V>(constraint: L) {
        self.init(constraint.object, constraint: constraint)
    }
    
    public init(_ object: V?, attribute: NSLayoutAttribute) {
        self.init(object, attribute: attribute, constant: 0, multiplier: 1)
    }
}
