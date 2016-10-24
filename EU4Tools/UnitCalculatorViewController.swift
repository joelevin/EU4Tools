//
//  UnitCalculatorViewController.swift
//  EU4Tools
//
//  Created by Joseph Levin on 4/21/16.
//  Copyright (c) 2016 Levin LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

typealias UnitCalculatorInput = (unitSize: Observable<String>, infantryRatio: Observable<String>, cavalryRatio: Observable<String>, cannonRatio: Observable<String>)

class UnitCalculatorViewController: UIViewController, UITextFieldDelegate {
    private var viewModel: UnitCalculatorViewModel!
    
    @IBOutlet weak var unitSizeField: UITextField!
    
    @IBOutlet weak var infantryRatioField: UITextField!
    @IBOutlet weak var cavalryRatioField: UITextField!
    @IBOutlet weak var cannonRatioField: UITextField!
    
    @IBOutlet weak var infantryTotalLabel: UILabel!
    @IBOutlet weak var cavalryTotalLabel: UILabel!
    @IBOutlet weak var cannonTotalLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.unitSizeField.text = "7"
        self.infantryRatioField.text = "4"
        self.cavalryRatioField.text = "1"
        self.cannonRatioField.text = "2"
        
        let inputFields: UnitCalculatorInput = (unitSize: unitSizeField.rx.text.orEmpty.asObservable(),
                                          infantryRatio: infantryRatioField.rx.text.orEmpty.asObservable(),
                                          cavalryRatio: cavalryRatioField.rx.text.orEmpty.asObservable(),
                                          cannonRatio: cannonRatioField.rx.text.orEmpty.asObservable())
        self.viewModel = UnitCalculatorViewModel(input: inputFields)
        self.viewModel.bindOutputs()
        self.viewModel.infantryOutput?.bindTo(self.infantryTotalLabel.rx.text).addDisposableTo(self.disposeBag)
        self.viewModel.cavalryOutput?.bindTo(self.cavalryTotalLabel.rx.text).addDisposableTo(self.disposeBag)
        self.viewModel.cannonryOutput?.bindTo(self.cannonTotalLabel.rx.text).addDisposableTo(self.disposeBag)
        
        self.title = self.viewModel.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
