//
//  GreaterThan.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

infix operator ~> {
associativity right

precedence 93
}

/// Initializes and *activates* `NSLayoutConstraint` with `NSLayoutRelation.GreaterThanOrEqual` relation.
public func ~> <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2>(lhs: LhsLayoutConstraint<Value>, rhs: L2) -> NSLayoutConstraint {
    return lhs ~> RhsConstraint(constraint: rhs)
}

/// Initializes and *activates* `NSLayoutConstraint` with `NSLayoutRelation.GreaterThanOrEqual` relation.
public func ~> <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2?>(lhs: LhsLayoutConstraint<Value>, rhs: L2) -> NSLayoutConstraint {
    return NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
}
