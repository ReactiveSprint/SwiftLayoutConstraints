//
//  LayoutConstraintHelper.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import SwiftLayoutConstraints

private class TestObject: LayoutConstrainHelper {
    private func ls_constraint(attribute: NSLayoutAttribute) -> LhsLayoutConstraint<TestObject> {
        return LhsLayoutConstraint(self, attribute: attribute)
    }
}

class LayoutConstraintHelperSpec: QuickSpec {
    override func spec() {
        let object = TestObject()
        
        it("should return valid attribute") {
            expect(object.ls_left.attribute) == NSLayoutAttribute.Left
            expect(object.ls_right.attribute) == NSLayoutAttribute.Right
            expect(object.ls_top.attribute) == NSLayoutAttribute.Top
            expect(object.ls_bottom.attribute) == NSLayoutAttribute.Bottom
            expect(object.ls_leading.attribute) == NSLayoutAttribute.Leading
            expect(object.ls_trailing.attribute) == NSLayoutAttribute.Trailing
            
            expect(object.ls_width.attribute) == NSLayoutAttribute.Width
            expect(object.ls_height.attribute) == NSLayoutAttribute.Height
            
            expect(object.ls_centerX.attribute) == NSLayoutAttribute.CenterX
            expect(object.ls_centerY.attribute) == NSLayoutAttribute.CenterY
            
            expect(object.ls_baseline.attribute) == NSLayoutAttribute.Baseline
            expect(object.ls_firstBaseline.attribute) == NSLayoutAttribute.FirstBaseline
            
            expect(object.ls_leftMargin.attribute) == NSLayoutAttribute.LeftMargin
            expect(object.ls_RightMargin.attribute) == NSLayoutAttribute.RightMargin
            expect(object.ls_topMargin.attribute) == NSLayoutAttribute.TopMargin
            expect(object.ls_bottomMargin.attribute) == NSLayoutAttribute.BottomMargin
            expect(object.ls_leadingMargin.attribute) == NSLayoutAttribute.LeadingMargin
            expect(object.ls_trailingMargin.attribute) == NSLayoutAttribute.TrailingMargin
            expect(object.ls_centerXWithinMargins.attribute) == NSLayoutAttribute.CenterXWithinMargins
            expect(object.ls_centerYWithinMargins.attribute) == NSLayoutAttribute.CenterYWithinMargins
        }
    }
}
