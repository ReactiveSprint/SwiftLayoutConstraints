//
//  EqualSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftLayoutConstraints

class EqualSpec: QuickSpec {
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
        
        describe("Equal two constraints") {
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
                expect(constraint.relation) == NSLayoutRelation.Equal
            }
            
            it("should equal two lhs constraints") {
                constraint = lhs ~== rhs
            }
            
            it("should equal with rhs constraints") {
                var rhs2 = RhsLayoutConstraint(constraint: rhs)
                rhs2.constant = -20
                rhs2.multiplier = 0.5
                constraint = lhs ~== rhs2
                
                expect(constraint.constant) == -20
                expect(constraint.multiplier) == 0.5
            }
        }
        
        describe("Equal constant") {
            it("should equal to a constant") {
                let lhs = LhsLayoutConstraint(view1, attribute: NSLayoutAttribute.Height)
                let constraint = lhs ~== 50
            
                expect(constraint.firstItem as? UIView) == view1
                expect(constraint.firstAttribute) == NSLayoutAttribute.Height
                expect(constraint.secondItem).to(beNil())
                expect(constraint.secondAttribute) == NSLayoutAttribute.NotAnAttribute
                expect(constraint.relation) == NSLayoutRelation.Equal
                expect(constraint.constant) == 50
                expect(constraint.multiplier) == 1
            }
        }
    }
}
