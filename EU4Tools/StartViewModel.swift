//
//  StartViewModel.swift
//  EU4Tools
//
//  Created by Joseph Levin on 5/5/16.
//  Copyright (c) 2016 Levin LLC. All rights reserved.
//

import Foundation
import UIKit

struct StartViewModel {
    var viewControllers: [UIViewController]
    var tabTitles: [String] {
        get {
            return ["Army Makeup"]
        }
    }
}