//
//  SavingsViewController.swift
//  Starling Savings
//
//  Created by Edward on 09/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import Foundation
import UIKit
import EFCountingLabel

class SavingsViewController : UIViewController {
    
    @IBOutlet weak var savingsGoalView: UIView!
    @IBOutlet weak var savingsLabel: EFCountingLabel!
    @IBOutlet weak var savingsProgressView: UIProgressView!
    
    let apiManager = APIManager()
    let dataManager = DataManager()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        
        setUpSavingsGoalView()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Defaults.savingsScreenNeedsUpdate {
            getSavingsGoal()
            Defaults.savingsScreenNeedsUpdate = false
        }
        
    }
    
    
    func getSavingsGoal() {
        
        apiManager.getFirstAccountAndDefaultCategory { (accountId, _) in
            self.apiManager.getSavingsGoalAmount(forAccountId: accountId, goalId: Defaults.User.savingsGoalId) { (amount) in
                
                if amount != 0 {self.updateSavingsView(withNewAmount: amount)}
                
            }
        }
        
    }
    
    
    func updateSavingsView(withNewAmount minorUnits : Int) {
        
        guard let previousMinorUnits = dataManager.minorUnitsFromLabel(savingsLabel) else {return}
        
        let previousValue = CGFloat(previousMinorUnits)/100
        let newValue = CGFloat(minorUnits)/100
        
        savingsLabel.setUpdateBlock { value, label in
            label.text = String(format: "%.2f%", locale: Locale.current, value)
        }
        savingsLabel.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        savingsLabel.countFrom(previousValue, to: newValue, withDuration: Defaults.UI.labelUpdateTime)
        
        let progress = Double(minorUnits)/Double(Defaults.User.savingsGoalTarget)
        
        UIView.animate(withDuration: Defaults.UI.labelUpdateTime) {
            self.savingsProgressView.setProgress(Float(progress), animated: true)
        }
    }
    
    
    func setUpSavingsGoalView() {
                
                if let parentView = savingsGoalView.superview {
                    parentView.layer.cornerRadius = Defaults.UI.viewCornerRadius
                    parentView.layer.shadowColor = UIColor.darkGray.cgColor
                    parentView.layer.shadowOffset = CGSize(width: 0, height: 10)
                    parentView.layer.shadowRadius = 25.0
                    parentView.layer.shadowOpacity = 0.5
                }
                
                savingsGoalView.layer.cornerRadius = Defaults.UI.viewCornerRadius
                savingsGoalView.clipsToBounds = true

        
    }
    
}
