//
//  UIView.swift
//  Pods
//
//  Created by Ahmad Baraka on 7/21/16.
//
//

import Foundation

extension UIView: LayoutConstrainHelper {
    public func ls_constraint(attribute: NSLayoutAttribute) -> LhsLayoutConstraint<UIView> {
        return LhsLayoutConstraint(self, attribute: attribute)
    }
}
