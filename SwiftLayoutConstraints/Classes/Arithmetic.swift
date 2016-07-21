//
//  Arithmetic.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

/// Converts any `LayoutConstraintType` to `RhsLayoutConstraint`
/// and adds `rhs` to its `constant.`
@warn_unused_result
public func + <Value, L: LayoutConstraintType where L.Value == Value>(lhs: L, rhs: CGFloat) -> RhsLayoutConstraint<Value> {
    var constraint = RhsLayoutConstraint(constraint: lhs)
    constraint.constant += rhs
    return constraint
}

/// Converts any `LayoutConstraintType` to `RhsLayoutConstraint`
/// and multiplies `rhs` to its `multiplier.`
@warn_unused_result
public func * <Value, L: LayoutConstraintType where L.Value == Value>(lhs: L, rhs: CGFloat) -> RhsLayoutConstraint<Value> {
    var constraint = RhsLayoutConstraint(constraint: lhs)
    constraint.multiplier *= rhs
    return constraint
}
