//
//  ArithmeticSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftLayoutConstraints

class ArithmeticSpec: QuickSpec {
    override func spec() {
        var view: UIView!
        
        beforeEach {
            view = UIView()
        }
        
        describe("plus") {
            it("should add constant") {
                let con1 = LhsLayoutConstraint(view, attribute: .Bottom)
                let constraint = con1 + 50
                
                expect(constraint.object) == view
                expect(constraint.attribute) == NSLayoutAttribute.Bottom
                expect(constraint.constant) == 50
                expect(constraint.multiplier) == 1
            }
            
            it("should add constant multiple times") {
                let con1 = LhsLayoutConstraint(view, attribute: .Bottom)
                let constraint = con1 + 50 + 50
                
                expect(constraint.object) == view
                expect(constraint.attribute) == NSLayoutAttribute.Bottom
                expect(constraint.constant) == 100
                expect(constraint.multiplier) == 1
            }
        }
        
        describe("multiply") {
            it("should multiply") {
                let con1 = LhsLayoutConstraint(view, attribute: .Bottom)
                let constraint = con1 * 0.5
                
                expect(constraint.object) == view
                expect(constraint.attribute) == NSLayoutAttribute.Bottom
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 0.5
            }
            
            it("should multiply multiple times") {
                let con1 = LhsLayoutConstraint(view, attribute: .Bottom)
                let constraint = con1 * 0.5 * 0.5
                
                expect(constraint.object) == view
                expect(constraint.attribute) == NSLayoutAttribute.Bottom
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 0.25
            }
        }
        
        describe("muliply and add") {
            it("should multiply and add") {
                let con1 = LhsLayoutConstraint(view, attribute: .Bottom)
                let constraint = con1 * 0.5 + 50
                
                expect(constraint.object) == view
                expect(constraint.attribute) == NSLayoutAttribute.Bottom
                expect(constraint.constant) == 50
                expect(constraint.multiplier) == 0.5
            }
            
            it("should only add") {
                let con1 = LhsLayoutConstraint(view, attribute: .Bottom)
                let constraint = con1 + 50 * 0.5
                
                expect(constraint.object) == view
                expect(constraint.attribute) == NSLayoutAttribute.Bottom
                expect(constraint.constant) == 25
                expect(constraint.multiplier) == 1
            }
        }
    }
}
