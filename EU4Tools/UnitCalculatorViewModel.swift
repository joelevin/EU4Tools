//
//  UnitCalculatorViewModel.swift
//  EU4Tools
//
//  Created by Joseph Levin on 4/21/16.
//  Copyright (c) 2016 Levin LLC. All rights reserved.
//

import Foundation

struct UnitCalculatorViewModel {
    let title = "Army Makeup"
    var infantryRatio: Int = 4
    var cavalryRatio: Int = 1
    var cannonRatio: Int = 2
    
    internal func calculateTotalInfantry(armyLimit: Int) -> Int {
        let percentage = percentageForUnit(self.infantryRatio)
        let total = Int(Double(armyLimit) * percentage)
        return total
    }
    
    internal func calculateTotalCavalry(armyLimit: Int) -> Int {
        let percentage = percentageForUnit(self.cavalryRatio)
        let total = Int(Double(armyLimit) * percentage)
        return total
    }
    
    internal func calculateTotalCannonry(armyLimit: Int) -> Int {
        let percentage = percentageForUnit(self.cannonRatio)
        let total = Int(Double(armyLimit) * percentage)
        return total
    }
    
    private func percentageForUnit(unitRatio: Int) -> Double {
        return Double(unitRatio) / Double(self.ratioTotal())
    }
    
    private func ratioTotal() -> Int {
        return self.infantryRatio + self.cavalryRatio + self.cannonRatio
    }
    
    lazy var numberFormatter: NSNumberFormatter = {
        var tempFormatter = NSNumberFormatter()
        tempFormatter.numberStyle = .DecimalStyle
        return tempFormatter
    }()
}