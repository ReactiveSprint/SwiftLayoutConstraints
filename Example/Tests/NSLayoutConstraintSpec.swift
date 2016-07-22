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
            
            afterEach {
                expect(constraint.firstItem as? NSObject) == lhs.object
                expect(constraint.firstAttribute) == lhs.attribute
            }
            
            it("should init with two lhs") {
                let view1 = UIView()
                let view2 = UIView()
                let parent = UIView()
                parent.addSubview(view1)
                parent.addSubview(view2)
                lhs = LhsLayoutConstraint(view1, attribute: NSLayoutAttribute.Bottom)
                let rhs = LhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top)
                
                constraint = NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.Equal)
                
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.Equal
            }
            
            it("should init with rhs") {
                let view1 = UIView()
                let view2 = UIView()
                let parent = UIView()
                parent.addSubview(view1)
                parent.addSubview(view2)
                lhs = LhsLayoutConstraint(view1, attribute: NSLayoutAttribute.Bottom)
                let rhs = RhsLayoutConstraint(view2, attribute: NSLayoutAttribute.Top, constant: -10, multiplier: 0.5)
                
                constraint = NSLayoutConstraint(lhs: lhs, rhs: rhs, relation: NSLayoutRelation.GreaterThanOrEqual)
                
                expect(constraint.secondItem as? UIView) == view2
                expect(constraint.secondAttribute) == NSLayoutAttribute.Top
                expect(constraint.relation) == NSLayoutRelation.GreaterThanOrEqual
                expect(constraint.constant) == -10
                expect(constraint.multiplier) == 0.5
            }
        }
    }
}
