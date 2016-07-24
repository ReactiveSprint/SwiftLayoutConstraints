//
//  NSLayoutConstraint.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/17/16.
//
//

import Foundation

public extension NSLayoutConstraint {
    /// Initializes and **activates** `NSLayoutConstraint` instance with values from `LayoutConstraintType.`
    ///
    /// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
    /// - Parameter rhs: Represents `secondItem` values.
    ///                  `constant` and `mutliplier` values are used to create this instance.
    ///                  Can be any `LayoutConstraintType.`
    /// - Parameter relation: `NSLayoutRelation` used to init to the `NSLayoutConstraint.`
    public convenience init<Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2>(lhs: LhsLayoutConstraint<Value1>, rhs: L2, relation: NSLayoutRelation) {
        self.init(lhs: lhs, rhs: RhsLayoutConstraint(constraint: rhs), relation: relation, activate: true)
    }
    
    /// Initializes and **activates** `NSLayoutConstraint` instance with values from `LayoutConstraintType.`
    ///
    /// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
    /// - Parameter rhs: Represents `secondItem` values.
    ///                  `constant` and `mutliplier` values are used to create this instance.
    ///                  Can be any `LayoutConstraintType.`
    /// - Parameter relation: `NSLayoutRelation` used to init to the `NSLayoutConstraint.`
    public convenience init<Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2?>(lhs: LhsLayoutConstraint<Value1>, rhs: L2, relation: NSLayoutRelation) {
        self.init(lhs: lhs, rhs: RhsLayoutConstraint(constraint: rhs), relation: relation, activate: true)
    }
    
    /// Initializes `NSLayoutConstraint` instance with values from `LayoutConstraintType.`
    ///
    /// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
    /// - Parameter rhs: Represents `secondItem` values.
    ///                  `constant` and `mutliplier` values are used to create this instance.
    ///                  Can be any `LayoutConstraintType.`
    /// - Parameter relation: `NSLayoutRelation` used to init to the `NSLayoutConstraint.`
    /// - Parameter activate: if `true`, the receiver will be activated immediately.
    public convenience init<Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2>(lhs: LhsLayoutConstraint<Value1>, rhs: L2, relation: NSLayoutRelation, activate: Bool) {
        self.init(lhs: lhs, rhs: RhsLayoutConstraint(constraint: rhs), relation: relation, activate: activate)
    }
    
    /// Initializes `NSLayoutConstraint` instance with values from `LayoutConstraintType.`
    ///
    /// - Parameter lhs: Represents `firstItem` values. Must always be `LhsLayoutConstraint.`
    /// - Parameter rhs: Represents `secondItem` values.
    ///                  `constant` and `mutliplier` values are used to create this instance.
    ///                  Can be any `LayoutConstraintType.`
    /// - Parameter relation: `NSLayoutRelation` used to init to the `NSLayoutConstraint.`
    /// - Parameter activate: if `true`, the receiver will be activated immediately.
    public convenience init<Value1: AnyObject, Value2: AnyObject, L2: LayoutConstraintType where L2.Value == Value2?>(lhs: LhsLayoutConstraint<Value1>, rhs: L2, relation: NSLayoutRelation, activate: Bool) {
        self.init(item: lhs.object,
                  attribute: lhs.attribute,
                  relatedBy: relation,
                  toItem: rhs.object,
                  attribute: rhs.attribute,
                  multiplier: rhs.multiplier,
                  constant: rhs.constant)
        
        if(activate) {
            active = true
        }
    }
}
