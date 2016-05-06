//
//  UnitCalculatorViewController.swift
//  EU4Tools
//
//  Created by Joseph Levin on 4/21/16.
//  Copyright (c) 2016 Levin LLC. All rights reserved.
//

import UIKit

class UnitCalculatorViewController: UIViewController, UITextFieldDelegate {
    private lazy var viewModel = UnitCalculatorViewModel()
    
    @IBOutlet weak var unitSizeField: UITextField!
    
    @IBOutlet weak var infantryRatioField: UITextField!
    @IBOutlet weak var cavalryRatioField: UITextField!
    @IBOutlet weak var cannonRatioField: UITextField!
    
    @IBOutlet weak var infantryTotalLabel: UILabel!
    @IBOutlet weak var cavalryTotalLabel: UILabel!
    @IBOutlet weak var cannonTotalLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.title
        
        self.unitSizeField.delegate = self
        
        self.infantryRatioField.text = String(stringInterpolationSegment: self.viewModel.infantryRatio)
        self.cavalryRatioField.text = String(stringInterpolationSegment: self.viewModel.cavalryRatio)
        self.cannonRatioField.text = String(stringInterpolationSegment: self.viewModel.cannonRatio)
        
        self.unitSizeField.text = "0"
        self.updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func updateUI() {
        if let armyLimit = self.viewModel.numberFormatter.numberFromString(self.unitSizeField.text) {
            if let infantryInput: NSNumber = self.viewModel.numberFormatter.numberFromString(self.infantryRatioField.text) {
                self.viewModel.infantryRatio = infantryInput.integerValue
                let infantryTotal = self.viewModel.calculateTotalInfantry(armyLimit.integerValue)
                self.infantryTotalLabel.text = self.viewModel.numberFormatter.stringFromNumber(infantryTotal)
            } else {
                self.infantryTotalLabel.text = ""
            }
            
            if let cavalryInput: NSNumber = self.viewModel.numberFormatter.numberFromString(self.cavalryRatioField.text) {
                self.viewModel.cavalryRatio = cavalryInput.integerValue
                let cavalryTotal = self.viewModel.calculateTotalCavalry(armyLimit.integerValue)
                self.cavalryTotalLabel.text = self.viewModel.numberFormatter.stringFromNumber(cavalryTotal)
            } else {
                self.cavalryTotalLabel.text = ""
            }
            
            if let cannonInput: NSNumber = self.viewModel.numberFormatter.numberFromString(self.cannonRatioField.text) {
                self.viewModel.cannonRatio = cannonInput.integerValue
                let cannonTotal = self.viewModel.calculateTotalCannonry(armyLimit.integerValue)
                self.cannonTotalLabel.text = self.viewModel.numberFormatter.stringFromNumber(cannonTotal)
            } else {
                self.cannonTotalLabel.text = ""
            }
            
        } else {
            self.infantryTotalLabel.text = ""
            self.cavalryTotalLabel.text = ""
            self.cannonTotalLabel.text = ""
        }
    }

    @IBAction func didTapCalculateButton(sender: AnyObject) {
        self.updateUI()
    }
}
