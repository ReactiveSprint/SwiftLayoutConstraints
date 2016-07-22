//
//  LhsLayoutConstraintSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/21/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
import SwiftLayoutConstraints

class LhsLayoutConstraintSpec: QuickSpec {
    override func spec() {
        describe("inits") {
            var object: NSObject!
            var constraint: LhsLayoutConstraint<NSObject>!
            
            beforeEach {
                object = NSObject()
            }
            
            afterEach {
                expect(constraint.object) == object
                expect(constraint.constant) == 0
                expect(constraint.multiplier) == 1
            }
            
            it("should init with object and attribute") {
                let attribute = NSLayoutAttribute.Bottom
                constraint = LhsLayoutConstraint(object, attribute: attribute)
                
                expect(constraint.attribute) == attribute
            }
            
            it("should init with object") {
                constraint = LhsLayoutConstraint(object)
                
                expect(constraint.attribute) == NSLayoutAttribute.NotAnAttribute
            }

            it("should copy values from another constraint with other type") {
                let object2 = NSURL()
                let attribute = NSLayoutAttribute.Bottom
                let org = LhsLayoutConstraint(object2, attribute: attribute)
                
                constraint = LhsLayoutConstraint(object, constraint: org)
                
                expect(constraint.attribute) == attribute
            }
            
            it("should copy values from another constraint") {
                let attribute = NSLayoutAttribute.Bottom
                
                let org = LhsLayoutConstraint(object, attribute: attribute)
                
                constraint = LhsLayoutConstraint(constraint: org)
                
                expect(constraint.attribute) == attribute
            }
        }
    }
}
