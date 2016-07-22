//
//  OrSpec.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 7/22/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Nimble
import Quick
@testable import SwiftLayoutConstraints

class OrSpec: QuickSpec {
    override func spec() {
        var view: UIView!
        beforeEach {
            view = UIView()
        }
        
        describe("two") {
            it("should add same LhsLayoutConstraint") {
                let constraint = LhsLayoutConstraint(view, attribute: .Top)
                
                let array: [LhsLayoutConstraint<UIView>] = constraint | .Bottom
                
                expect(array.count) == 2
                
                expect(array[1].object) == view
                expect(array[1].attribute) == NSLayoutAttribute.Bottom
                expect(array[1].constant) == DefaultConsant
                expect(array[1].multiplier) == DefaultMultiplier
            }
            
            it("should add same RhsLayoutConstraint") {
                let constraint = RhsLayoutConstraint(view, attribute: .Top, constant: 50, multiplier: 0.5)
                
                let array: [RhsLayoutConstraint<UIView>] = constraint | .Bottom
                
                expect(array.count) == 2
                
                expect(array[1].object) == view
                expect(array[1].attribute) == NSLayoutAttribute.Bottom
                expect(array[1].constant) == 50
                expect(array[1].multiplier) == 0.5
            }
        }
        
        it("should add multi constraints") {
            let constraint = LhsLayoutConstraint(view, attribute: .Top)
            
            let array: [LhsLayoutConstraint<UIView>] = constraint | .Bottom | .Left
            
            expect(array.count) == 3
            
            expect(array[1].object) == view
            expect(array[1].attribute) == NSLayoutAttribute.Bottom
            
            expect(array[2].object) == view
            expect(array[2].attribute) == NSLayoutAttribute.Left
        }
        
        it("should add mixed constraints") {
            let con1 = LhsLayoutConstraint(view, attribute: .Top)
            let con2 = RhsLayoutConstraint(view, attribute: .Left, constant: 50, multiplier: 0.5)
            
            let array: [RhsLayoutConstraint<UIView>] = con1 | con2 | .Bottom
            
            expect(array.count) == 3
            
            expect(array[0].object) == view
            expect(array[0].attribute) == NSLayoutAttribute.Top
            expect(array[0].constant) == DefaultConsant
            expect(array[0].multiplier) == DefaultMultiplier
            
            expect(array[1].object) == view
            expect(array[1].attribute) == NSLayoutAttribute.Left
            expect(array[1].constant) == 50
            expect(array[1].multiplier) == 0.5
            
            expect(array[2].object) == view
            expect(array[2].attribute) == NSLayoutAttribute.Bottom
            expect(array[2].constant) == 50
            expect(array[2].multiplier) == 0.5
        }
    }
}
