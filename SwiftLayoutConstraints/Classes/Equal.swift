//
//  Equal.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

infix operator ~= {
associativity right

precedence 93
}

/// Initializes and **activates** `NSLayoutConstraint` instance with values from `LayoutConstraintType`
/// and `NSLayoutRelation.Equal` relation.
///
/// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
/// - Parameter rhs: Represents `secondItem` values.
///                  `constant` and `mutliplier` values are used to create this instance.
///                  Can be any `LayoutConstraintType.`
public func ~= <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2>( lhs: LhsLayoutConstraint<Value1>, rhs: L2) -> NSLayoutConstraint {
    return lhs ~= RhsLayoutConstraint(constraint: rhs)
}

/// Initializes and **activates** `NSLayoutConstraint` instance with values from `LayoutConstraintType`
/// and `NSLayoutRelation.Equal` relation.
///
/// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
/// - Parameter rhs: Represents `secondItem` values.
///                  `constant` and `mutliplier` values are used to create this instance.
///                  Can be any `LayoutConstraintType.`
public func ~= <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2?>(lhs: LhsLayoutConstraint<Value1>, rhs: L2) -> NSLayoutConstraint {
    return NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: .Equal)
}