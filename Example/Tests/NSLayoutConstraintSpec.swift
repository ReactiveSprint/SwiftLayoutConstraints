//
//  NSLayoutConstraintSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftLayoutConstraints

class NSLayoutConstraintSpec: QuickSpec {
    override func spec() {
        describe("init with constraints") {
            var lhs: LhsLayoutConstraint<NSObject>!
            var constraint: NSLayoutConstraint!
            var view1: UIView!
            var view2: UIView!
            var parent: UIView!
            
            beforeEach {
                view1 = UIView()
                view2 = UIView()
                parent = UIView()
                parent.addSubview(view1)
                parent.addSubview(view2)
                
                lhs = LhsLayoutConstraint(view1, attribute: NSLayoutAttribute.Bottom)
            }
            
            afterEach {
                expect(constraint.firstItem as? NSObject) == lhs.object
                expect(constraint.firstAttribute) == lhs.attribute
            }
            
            it("should init with two lhs") {
                let rhs = LhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top)
                
                constraint = NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.Equal, activate: false)
                
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.Equal
                expect(constraint.active) == false
            }
            
            it("should init with two lhs and activate") {
                let rhs = LhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top)
                
                constraint = NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.Equal)
                
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.Equal
                expect(constraint.active) == true
            }
            
            it("should init with rhs") {
                let rhs = RhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top, constant: -10, multiplier: 0.5)
                
                constraint = NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.GreaterThanOrEqual, activate: false)
                
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.GreaterThanOrEqual
                expect(constraint.constant) == -10
                expect(constraint.multiplier) == 0.5
                expect(constraint.active) == false
            }
            
            it("should init with rhs and activate") {
                let rhs = RhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top, constant: -10, multiplier: 0.5)
                
                constraint = NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
                
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.GreaterThanOrEqual
                expect(constraint.constant) == -10
                expect(constraint.multiplier) == 0.5
                expect(constraint.active) == true
            }
        }
    }
}
