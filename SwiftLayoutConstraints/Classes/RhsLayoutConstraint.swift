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
    
    public init(_ object: V?, attribute: NSLayoutAttribute) {
        self.object = object
        self.attribute = attribute
        self.constant = 0
        self.multiplier = 0
    }
    
    public init(_ object: V?, attribute: NSLayoutAttribute, constant: CGFloat, multiplier: CGFloat) {
        self.object = object
        self.attribute = attribute
        self.constant = constant
        self.multiplier = multiplier
    }
    
    public init<L : LayoutConstraintType where L.Value == V?>(_ object: V?, constraint: L) {
        self.object = object
        attribute = constraint.attribute
        constant = constraint.constant
        multiplier = constraint.multiplier
    }
}
