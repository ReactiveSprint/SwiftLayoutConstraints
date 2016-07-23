# SwiftLayoutConstraints

[![CI Status](http://img.shields.io/travis/ahmadbaraka/SwiftLayoutConstraints.svg?style=flat)](https://travis-ci.org/ahmadbaraka/SwiftLayoutConstraints)

`SwiftLayoutConstraints` aims to provide expressive `NSLayoutConstraint` with Swift.

#### Compatibility

SwiftLayoutConstraints targets `Swift 2.2` and `iOS 8`

## Constraints

Basic Constraints can be made such as:

```swift
// assume we have 2 views and they are added to one parent
let view1 = UIView()
view1.translatesAutoresizingMaskIntoConstraints = false
view1.backgroundColor = UIColor.greenColor()
let view2 = UIView()
view2.translatesAutoresizingMaskIntoConstraints = false
view2.backgroundColor = UIColor.blueColor()
view.addSubview(view1)
view.addSubview(view2)

// Expressions below create, **activate** and return constraints
view1.ls_top | .Left | .Right ~== view
view2.ls_top ~== view1.ls_bottom + 40
view1.ls_height ~== view.ls_height * 0.25 + 50
view2.ls_left | .Right | .Bottom ~== view
```
The above code generates this output:  
![Example](Icons/Example.png)

## Overview

LayoutConstraints are represented as [LayoutConstraintType](/SwiftLayoutConstraints/Classes/LayoutConstraintType.swift), and has two implementations:
 1. [LhsLayoutConstraint](/SwiftLayoutConstraints/Classes/LhsLayoutConstraint.swift) represents left-hand side, and does NOT support mutating its `constant` and `multiplier.`
 1. [RhsLayoutConstraint](/SwiftLayoutConstraints/Classes/RhsLayoutConstraint.swift) represents right-hand side, and supports mutating its `constant` and `multiplier.`

### Relation Operators

`SwiftLayoutConstraints` introduces operators to represent each `NSLayoutRelation`, simply `~` is added before the expressive form of the relation.
 * `~==` for `NSLayoutRelation.Equal`
 * `~>=` for `NSLayoutRelation.GreaterThanOrEqual`
 * `~<=` for `NSLayoutRelation.LessThanOrEqual`

### Supported Expressions

Representing any Relation Operator as `:op`, the following expressions are supported:

```
LhsLayoutConstraint :op LayoutConstraintType
LhsLayoutConstraint :op CGFloat
[LhsLayoutConstraint] :op AnyObject
AnyObject :op [LayoutConstraintType]
[LhsLayoutConstraint] :op [LayoutConstraintType]
```

###  Quick Notes

 1. At any point, Left-hand side of any expression is always `LhsLayoutConstraint`
 1. You may create an array of constraints using `|` operator, i.e: `view.ls_height | view.ls_width`
 1. Operator `|` also accepts `NSLayoutAttribute` where values (object, constant and multiplier) are taken from previous constraint, i.e: `view.ls_top | .Bottom`
 1. You may use `+` or `*` to set constraint's `constant` and `multiplier`, i.e: `view1.ls_top ~== view2.ls_bottom * 1 + 20`
 1. Consider operators `precedence` in your expressions, i.e: `view.ls_top * 0.5 + 50` is not same as `view.ls_top + 50 * 0.5`

## Installation

This project is currently under development. But a [CocoaPod](https://cocoapods.org) will be available. And [Carthage](https://github.com/Carthage/Carthage) will be supported as well.

## License

SwiftLayoutConstraints is available under the MIT license. See the LICENSE file for more info.
