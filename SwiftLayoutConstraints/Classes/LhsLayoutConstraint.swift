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
}
