//
//  StartViewController.swift
//  EU4Tools
//
//  Created by Joseph Levin on 5/5/16.
//  Copyright (c) 2016 Levin LLC. All rights reserved.
//

import UIKit

enum SegueIdentifier: String {
    case UnitCalculator = "UnitCalculator"
}

class StartViewController: UITabBarController {
    var viewModel: StartViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let viewControllers = self.viewControllers {
            self.viewModel = StartViewModel(viewControllers: viewControllers)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
