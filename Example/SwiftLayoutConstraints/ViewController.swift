//
//  ViewController.swift
//  SwiftLayoutConstraints
//
//  Created by Ahmad Baraka on 07/22/2016.
//  Copyright (c) 2016 Ahmad Baraka. All rights reserved.
//

import UIKit
import SwiftLayoutConstraints

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
}
