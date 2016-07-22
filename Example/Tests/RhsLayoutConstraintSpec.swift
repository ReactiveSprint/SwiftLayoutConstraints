//
//  RhsLayoutConstraintSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftLayoutConstraints

class RhsLayoutConstraintSpec: QuickSpec {
    override func spec() {
        describe("inits") {
            var object: NSObject!
            var constraint: RhsLayoutConstraint<NSObject>!
            
            beforeEach {
                object = NSObject()
            }
            
            it("should init with all values") {
                let attribute = NSLayoutAttribute.Top
                constraint = RhsLayoutConstraint(object, attribute: attribute, constant: 10, multiplier: 0.5)
                
                expect(constraint.object) == object
                expect(constraint.attribute) == attribute
                expect(constraint.constant) == 10
                expect(constraint.multiplier) == 0.5
            }
            
            it("should init with constant") {
                constraint = RhsLayoutConstraint(constant: 10)
                
                expect(constraint.object).to(beNil())
                expect(constraint.attribute) == NSLayoutAttribute.NotAnAttribute
                expect(constraint.constant) == 10
                expect(constraint.multiplier) == 1
            }
            
            it("should init with object and attribute") {
                let attribute = NSLayoutAttribute.Bottom
                constraint = RhsLayoutConstraint(object, attribute: attribute)
                
                expect(constraint.object) == object
                expect(constraint.attribute) == attribute
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 1
            }
            
            it("should init with object") {
                constraint = RhsLayoutConstraint(object)
                
                expect(constraint.object) == object
                expect(constraint.attribute) == NSLayoutAttribute.NotAnAttribute
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 1
            }
            
            it("should copy values from another constraint with other type") {
                let object2 = NSURL()
                let attribute = NSLayoutAttribute.Bottom
                let org = RhsLayoutConstraint(object2, attribute: attribute)
                
                constraint = RhsLayoutConstraint(object, constraint: org)
                
                expect(constraint.object) == object
                expect(constraint.attribute) == attribute
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 1
            }
            
            it("should copy values from another constraint") {
                let attribute = NSLayoutAttribute.Bottom
                
                let org = RhsLayoutConstraint(object, attribute: attribute)
                
                constraint = RhsLayoutConstraint(constraint: org)
                
                expect(constraint.object) == object
                expect(constraint.attribute) == attribute
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 1
            }
        }
    }
}
