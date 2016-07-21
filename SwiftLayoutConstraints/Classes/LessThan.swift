//
//  LessThan.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

infix operator ~< {
associativity right

precedence 93
}

/// Initializes and *activates* `NSLayoutConstraint` with `NSLayoutRelation.LessThanOrEqual` relation.
public func ~< <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2>(lhs: LhsLayoutConstraint<Value1>, rhs: L2) -> NSLayoutConstraint {
    return lhs ~< RhsLayoutConstraint(constraint: rhs)
}

/// Initializes and *activates* `NSLayoutConstraint` with `NSLayoutRelation.LessThanOrEqual` relation.
public func ~< <Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2?>(lhs: LhsLayoutConstraint<Value1>, rhs: L2) -> NSLayoutConstraint {
    return NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.LessThanOrEqual)
}

/// Initializes an **activates** `NSLayoutConstraint` array, where `rhs` values are taken from
/// `lhs.`
///
/// This is a shortcut to create for example: `object1.top | left | right ~< object2.top | left | right.`
public func ~< <Value: AnyObject>(lhs: [LhsLayoutConstraint<Value>], rhs: Value) -> [NSLayoutConstraint] {
    return lhs.map { return $0 ~< RhsLayoutConstraint(rhs, constraint: $0) }
}

/// Initializes an **activates** `NSLayoutConstraint` array, where `lhs` values are taken from
/// `rhs.`
///
/// This is a shortcut to create for example: `object1.top | left | right ~< object2.top | left | right.`
public func ~< <Value: AnyObject, L: LayoutConstraintType where L.Value == Value>(lhs: Value, rhs: [L]) -> [NSLayoutConstraint] {
    return rhs.map { return LhsLayoutConstraint(lhs, constraint: $0) ~< $0 }
}

/// Initializes an **activates** `NSLayoutConstraint` array, where `lhs` values are taken from
/// `rhs.`
///
/// This is a shortcut to create for example: `object1.top | left | right ~< object2.top | left | right.`
public func ~< <Value: AnyObject, L: LayoutConstraintType where L.Value == Value?>(lhs: Value, rhs: [L]) -> [NSLayoutConstraint] {
    return rhs.map { return LhsLayoutConstraint(lhs, constraint: $0) ~< $0 }
}

/// Initializes an **activates** `NSLayoutConstraint` array,
/// applying `~<` for each element in `lhs` to each element in `rhs.`
public func ~< <Value: AnyObject, L: LayoutConstraintType where L.Value == Value>(lhs: [LhsLayoutConstraint<Value>], rhs: [L]) -> [NSLayoutConstraint] {
    precondition(lhs.count == rhs.count)
    
    var constraints = [NSLayoutConstraint]()
    for i in 0..<lhs.count {
        constraints.append(lhs[i] ~< rhs[i])
    }
    
    return constraints
}
