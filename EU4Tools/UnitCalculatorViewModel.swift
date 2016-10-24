//
//  UnitCalculatorViewModel.swift
//  EU4Tools
//
//  Created by Joseph Levin on 4/21/16.
//  Copyright (c) 2016 Levin LLC. All rights reserved.
//

import Foundation
import RxSwift

class UnitCalculatorViewModel {
    
    let unitSizeInput: Observable<String>
    let infantryRatioInput: Observable<String>
    let cavalryRatioInput: Observable<String>
    let cannonRatioInput: Observable<String>
    
    var infantryOutput: Observable<String>?
    var cavalryOutput: Observable<String>?
    var cannonryOutput: Observable<String>?
    
    let title = "Army Makeup"
    
    var unitSizeDefault = 7
    var infantryRatio: Int = 4
    var cavalryRatio: Int = 1
    var cannonRatio: Int = 2
    
    init(input: UnitCalculatorInput)
    {
        self.unitSizeInput = input.unitSize
        self.infantryRatioInput = input.infantryRatio
        self.cavalryRatioInput = input.cavalryRatio
        self.cannonRatioInput = input.cannonRatio        
    }
    
    internal func bindOutputs() {
        self.infantryOutput = Observable.combineLatest(self.unitSizeInput, self.infantryRatioInput, self.cavalryRatioInput, self.cannonRatioInput, resultSelector: { (unitSize, infantryRatio, cavalaryRatio, cannonRatio) -> String in
            let unitSizeInt = (!unitSize.isEmpty ? Int(unitSize) : 0) ?? 0
            let infantryRatioInt = (!infantryRatio.isEmpty ? Int(infantryRatio) : 0) ?? 0
            let cavalryRatioInt = (!cavalaryRatio.isEmpty ? Int(cavalaryRatio) : 0) ?? 0
            let cannonRatioInt = (!cannonRatio.isEmpty ? Int(cannonRatio) : 0) ?? 0
            let ratioTotal = infantryRatioInt + cavalryRatioInt + cannonRatioInt
            return String(self.calculateUnitSize(armyLimit: unitSizeInt, ratio: infantryRatioInt, ratioTotal: ratioTotal))
        }).asObservable()
        
        self.cavalryOutput = Observable.combineLatest(self.unitSizeInput, self.infantryRatioInput, self.cavalryRatioInput, self.cannonRatioInput, resultSelector: { (unitSize, infantryRatio, cavalaryRatio, cannonRatio) -> String in
            let unitSizeInt = (!unitSize.isEmpty ? Int(unitSize) : 0) ?? 0
            let infantryRatioInt = (!infantryRatio.isEmpty ? Int(infantryRatio) : 0) ?? 0
            let cavalryRatioInt = (!cavalaryRatio.isEmpty ? Int(cavalaryRatio) : 0) ?? 0
            let cannonRatioInt = (!cannonRatio.isEmpty ? Int(cannonRatio) : 0) ?? 0
            let ratioTotal = infantryRatioInt + cavalryRatioInt + cannonRatioInt
            return String(self.calculateUnitSize(armyLimit: unitSizeInt, ratio: cavalryRatioInt, ratioTotal: ratioTotal))
        }).asObservable()
        
        self.cannonryOutput = Observable.combineLatest(self.unitSizeInput, self.infantryRatioInput, self.cavalryRatioInput, self.cannonRatioInput, resultSelector: { (unitSize, infantryRatio, cavalaryRatio, cannonRatio) -> String in
            let unitSizeInt = (!unitSize.isEmpty ? Int(unitSize) : 0) ?? 0
            let infantryRatioInt = (!infantryRatio.isEmpty ? Int(infantryRatio) : 0) ?? 0
            let cavalryRatioInt = (!cavalaryRatio.isEmpty ? Int(cavalaryRatio) : 0) ?? 0
            let cannonRatioInt = (!cannonRatio.isEmpty ? Int(cannonRatio) : 0) ?? 0
            let ratioTotal = infantryRatioInt + cavalryRatioInt + cannonRatioInt
            return String(self.calculateUnitSize(armyLimit: unitSizeInt, ratio: cannonRatioInt, ratioTotal: ratioTotal))
        }).asObservable()

    }
    
    internal func calculateUnitSize(armyLimit: Int, ratio: Int, ratioTotal: Int) -> Int {
        let percentage = percentageForUnit(unitRatio: ratio, ratioTotal: ratioTotal)
        let total = Int(Double(armyLimit) * percentage)
        return total
    }
    
    private func percentageForUnit(unitRatio: Int, ratioTotal: Int) -> Double {
        guard ratioTotal > 0 else {
            return 0
        }
        return Double(unitRatio) / Double(ratioTotal)
    }
}
