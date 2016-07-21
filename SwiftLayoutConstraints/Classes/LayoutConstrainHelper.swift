//
//  LayoutConstrainHelper.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/21/16.
//
//

import Foundation

/// Protocol to add convenience properties to create `LhsLayoutConstraint`
///
/// Example to add these properties to `UIView`:
/// ```swift
/// extension UIView: LayoutConstrainHelper {
///     public func ls_constraint(attribute: NSLayoutAttribute) -> LhsLayoutConstraint<UIView> {
///         return LhsLayoutConstraint(self, attribute: attribute)
///     }
/// }
/// ```
public protocol LayoutConstrainHelper {
    associatedtype ObjectType: AnyObject
    
    func ls_constraint(attribute: NSLayoutAttribute) -> LhsLayoutConstraint<ObjectType>
    
    var ls_left: LhsLayoutConstraint<ObjectType> { get }
    var ls_right: LhsLayoutConstraint<ObjectType> { get }
    var ls_top: LhsLayoutConstraint<ObjectType> { get }
    var ls_bottom: LhsLayoutConstraint<ObjectType> { get }
    var ls_leading: LhsLayoutConstraint<ObjectType> { get }
    var ls_trailing: LhsLayoutConstraint<ObjectType> { get }
    
    var ls_width: LhsLayoutConstraint<ObjectType> { get }
    var ls_height: LhsLayoutConstraint<ObjectType> { get }
    
    var ls_centerX: LhsLayoutConstraint<ObjectType> { get }
    var ls_centerY: LhsLayoutConstraint<ObjectType> { get }
    
    var ls_baseline: LhsLayoutConstraint<ObjectType> { get }
    var ls_firstBaseline: LhsLayoutConstraint<ObjectType> { get }
    
    var ls_leftMargin: LhsLayoutConstraint<ObjectType> { get }
    var ls_RightMargin: LhsLayoutConstraint<ObjectType> { get }
    var ls_topMargin: LhsLayoutConstraint<ObjectType> { get }
    var ls_bottomMargin: LhsLayoutConstraint<ObjectType> { get }
    var ls_leadingMargin: LhsLayoutConstraint<ObjectType> { get }
    var ls_trailingMargin: LhsLayoutConstraint<ObjectType> { get }
    var ls_centerXWithinMargins: LhsLayoutConstraint<ObjectType> { get }
    var ls_centerYWithinMargins: LhsLayoutConstraint<ObjectType> { get }
}

public extension LayoutConstrainHelper {
    public var ls_left: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Left)
    }
    
    public var ls_right: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Right)
    }
    
    public var ls_top: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Top)
    }
    
    public var ls_bottom: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Bottom)
    }
    
    public var ls_leading: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Leading)
    }
    
    public var ls_trailing: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Trailing)
    }
    
    public var ls_width: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Width)
    }
    
    public var ls_height: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Height)
    }
    
    public var ls_centerX: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.CenterX)
    }
    
    public var ls_centerY: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.CenterY)
    }
    
    var ls_baseline: LhsLayoutConstraint<ObjectType> {
        return ls_constraint(.Baseline)
    }
    
    var ls_firstBaseline: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.FirstBaseline)
    }
    
    var ls_leftMargin: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.LeftMargin)
    }
    
    var ls_RightMargin: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.RightMargin)
    }
    
    var ls_topMargin: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.TopMargin)
    }
    
    var ls_bottomMargin: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.BottomMargin)
    }
    
    var ls_leadingMargin: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.LeadingMargin)
    }
    
    var ls_trailingMargin: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.TrailingMargin)
    }
    
    var ls_centerXWithinMargins: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.CenterXWithinMargins)
    }
    
    var ls_centerYWithinMargins: LhsLayoutConstraint<ObjectType>  {
        return ls_constraint(.CenterYWithinMargins)
    }
}
