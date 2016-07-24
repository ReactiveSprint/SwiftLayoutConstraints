//
//  LessThanSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/24/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftLayoutConstraints

class LessThanSpec: QuickSpec {
    override func spec() {
        var view1: UIView!
        var view2: UIView!
        var parent: UIView!
        
        beforeEach {
            view1 = UIView()
            view2 = UIView()
            parent = UIView()
            parent.addSubview(view1)
            parent.addSubview(view2)
        }
        
        describe("LessThan two constraints") {
            var lhs: LhsLayoutConstraint<UIView>!
            var rhs: LhsLayoutConstraint<UIView>!
            var constraint: NSLayoutConstraint!
            
            beforeEach {
                lhs = LhsLayoutConstraint(view1, attribute: NSLayoutAttribute.Bottom)
                rhs = LhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top)
            }
            
            afterEach {
                expect(constraint.firstItem as? UIView) == view1
                expect(constraint.firstAttribute) == NSLayoutAttribute.Bottom
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.LessThanOrEqual
            }
            
            it("should LessThan two lhs constraints") {
                constraint = lhs ~<= rhs
            }
            
            it("should LessThan with rhs constraints") {
                var rhs2 = RhsLayoutConstraint(constraint: rhs)
                rhs2.constant = -20
                rhs2.multiplier = 0.5
                constraint = lhs ~<= rhs2
                
                expect(constraint.constant) == -20
                expect(constraint.multiplier) == 0.5
            }
        }
        
        describe("LessThan constant") {
            it("should LessThan to a constant") {
                let lhs = LhsLayoutConstraint(view1, attribute: NSLayoutAttribute.Height)
                let constraint = lhs ~<= 50
                
                expect(constraint.firstItem as? UIView) == view1
                expect(constraint.firstAttribute) == NSLayoutAttribute.Height
                expect(constraint.secondItem).to(beNil())
                expect(constraint.secondAttribute) == NSLayoutAttribute.NotAnAttribute
                expect(constraint.relation) == NSLayoutRelation.LessThanOrEqual
                expect(constraint.constant) == 50
                expect(constraint.multiplier) == 1
            }
        }
        
        describe("LessThan array") {
            it("should LessThan view to array") {
                let constraints = view1.ls_top | view1.ls_bottom | view1.ls_trailing | view1.ls_leading ~<= parent
                
                expect(constraints.count) == 4
                
                expect(constraints[0].firstItem as? UIView) == view1
                expect(constraints[0].firstAttribute) == NSLayoutAttribute.Top
                expect(constraints[0].secondItem as? UIView) == parent
                expect(constraints[0].secondAttribute) == NSLayoutAttribute.Top
                
                expect(constraints[1].firstItem as? UIView) == view1
                expect(constraints[1].firstAttribute) == NSLayoutAttribute.Bottom
                expect(constraints[1].secondItem as? UIView) == parent
                expect(constraints[1].secondAttribute) == NSLayoutAttribute.Bottom
                
                expect(constraints[2].firstItem as? UIView) == view1
                expect(constraints[2].firstAttribute) == NSLayoutAttribute.Trailing
                expect(constraints[2].secondItem as? UIView) == parent
                expect(constraints[2].secondAttribute) == NSLayoutAttribute.Trailing
                
                expect(constraints[3].firstItem as? UIView) == view1
                expect(constraints[3].firstAttribute) == NSLayoutAttribute.Leading
                expect(constraints[3].secondItem as? UIView) == parent
                expect(constraints[3].secondAttribute) == NSLayoutAttribute.Leading
            }
        }
    }
}
