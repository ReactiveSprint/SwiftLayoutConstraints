//
//  Or.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/21/16.
//
//

import Foundation

/// Creates a new `LayoutConstraintType` with all values from `lhs` and attribute `rhs`
/// then returns an array with `rhs` value and the created instance.
///
/// This is a shortcut to creating multiple `LayoutConstraintType` 
/// sharing same values except their `attribute.`
@warn_unused_result
public func | <L: LayoutConstraintType>(lhs: L, rhs: NSLayoutAttribute) -> [L] {
    var second = lhs
    second.attribute = rhs
    return [lhs, second]
}

/// Returns an array with `lhs` and `rhs.`
@warn_unused_result
public func | <L: LayoutConstraintType>(lhs: L, rhs: L) -> [L] {
    return [lhs, rhs]
}

/// Returns an array with `lhs` and `rhs.`
@warn_unused_result
public func | <Value: AnyObject, L: LayoutConstraintType where L.Value == Value>(lhs: L, rhs: RhsLayoutConstraint<Value>) -> [RhsLayoutConstraint<Value>] {
    return [RhsLayoutConstraint(constraint: lhs), rhs]
}

/// Returns an array with `lhs` and `rhs.`
@warn_unused_result
public func | <Value: AnyObject, L: LayoutConstraintType where L.Value == Value>(lhs: RhsLayoutConstraint<Value>, rhs: L) -> [RhsLayoutConstraint<Value>] {
    return [lhs, RhsLayoutConstraint(constraint: rhs)]
}
