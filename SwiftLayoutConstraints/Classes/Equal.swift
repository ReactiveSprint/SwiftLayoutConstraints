//
//  Equal.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

infix operator ~== {
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
public func ~== <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2>( lhs: LhsLayoutConstraint<Value1>, rhs: L2) -> NSLayoutConstraint {
    return lhs ~== RhsLayoutConstraint(constraint: rhs)
}

/// Initializes and **activates** `NSLayoutConstraint` instance with values from `LayoutConstraintType`
/// and `NSLayoutRelation.Equal` relation.
///
/// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
/// - Parameter rhs: Represents `secondItem` values.
///                  `constant` and `mutliplier` values are used to create this instance.
///                  Can be any `LayoutConstraintType.`
public func ~== <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2?>(lhs: LhsLayoutConstraint<Value1>, rhs: L2) -> NSLayoutConstraint {
    return NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: .Equal)
}

/// Initializes and **activates* `NSLayoutConstraint` with `lhs` and `rhs` with nil object
/// and `rhs` constant.
///
/// e.g: `object.height ~== 500`
public func ~== <Value: AnyObject>(lhs: LhsLayoutConstraint<Value>, rhs: CGFloat) -> NSLayoutConstraint {
    return lhs ~== RhsLayoutConstraint<Value>(constant: rhs)
}

/// Initializes an **activates** `NSLayoutConstraint` array, where `rhs` values are taken from
/// `lhs.`
///
/// This is a shortcut to create for example: `object1.top | left | right = object2.top | left | right.`
public func ~== <Value1: AnyObject, Value2: AnyObject>(lhs: [LhsLayoutConstraint<Value1>], rhs: Value2) -> [NSLayoutConstraint] {
    let right = lhs.map { RhsLayoutConstraint(rhs, constraint: $0) }
    return lhs ~== right
}

/// Initializes an **activates** `NSLayoutConstraint` array, where `lhs` values are taken from
/// `rhs.`
///
/// This is a shortcut to create for example: `object1.top | left | right = object2.top | left | right.`
public func ~== <Value1: AnyObject, Value2: AnyObject, L: LayoutConstraintType where L.Value == Value2>(lhs: Value1, rhs: [L]) -> [NSLayoutConstraint] {
    let left = rhs.map { LhsLayoutConstraint(lhs, constraint: $0) }
    return left ~== rhs
}

/// Initializes an **activates** `NSLayoutConstraint` array, where `lhs` values are taken from
/// `rhs.`
///
/// This is a shortcut to create for example: `object1.top | left | right = object2.top | left | right.`
public func ~== <Value1: AnyObject, Value2: AnyObject, L: LayoutConstraintType where L.Value == Value2?>(lhs: Value1, rhs: [L]) -> [NSLayoutConstraint] {
    let left = rhs.map { LhsLayoutConstraint(lhs, constraint: $0) }
    return left ~== rhs
}

/// Initializes an **activates** `NSLayoutConstraint` array,
/// applying `~==` for each element in `lhs` to each element in `rhs.`
public func ~== <Value1: AnyObject, Value2: AnyObject, L: LayoutConstraintType where L.Value == Value2>(lhs: [LhsLayoutConstraint<Value1>], rhs: [L]) -> [NSLayoutConstraint] {
    return lhs ~== rhs.map { RhsLayoutConstraint(constraint: $0) }
}

/// Initializes an **activates** `NSLayoutConstraint` array,
/// applying `~==` for each element in `lhs` to each element in `rhs.`
public func ~== <Value1: AnyObject, Value2: AnyObject, L: LayoutConstraintType where L.Value == Value2?>(lhs: [LhsLayoutConstraint<Value1>], rhs: [L]) -> [NSLayoutConstraint] {
    precondition(lhs.count == rhs.count)
    
    var constraints = [NSLayoutConstraint]()
    for i in 0..<lhs.count {
        constraints.append(NSLayoutConstraint(lhs: lhs[i], rhs: rhs[i], relation: .Equal, activate: false))
    }
    
    NSLayoutConstraint.activateConstraints(constraints)
    
    return constraints
}
