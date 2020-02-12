//
//  SavingsViewController.swift
//  Starling Savings
//
//  Created by Edward on 09/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import UIKit
import EFCountingLabel

/**
Savings View Controller containing the customer's saving goals.
Saved amount and target amount are displayed, along with a progress view.
Only the roundups goal was implemented here for convenience.
*/
class SavingsViewController : UIViewController {
    
    @IBOutlet weak var savingsGoalView: UIView!
    @IBOutlet weak var savingsLabel: EFCountingLabel!
    @IBOutlet weak var savingsProgressView: UIProgressView!
    
    let apiManager = APIManager()
    let dataManager = DataManager()
    
    
/// Called when the view was loaded. Setup interface elements.
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSavingsGoalView()
    }
    
    
/// Called before the view appears. Load data and refresh interface elements if need be.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if Defaults.savingsScreenNeedsUpdate {
            getSavingsGoal()
            Defaults.savingsScreenNeedsUpdate = false
        }
    }
    
    
/// Call API method to get saved amount and update the view.
    func getSavingsGoal() {
        
        apiManager.getFirstAccountAndDefaultCategory { (accountId, _) in
            self.apiManager.getSavingsGoalAmount(forAccountId: accountId, goalId: Defaults.User.savingsGoalId) { (amount) in
            
                // Only update the view if the saved amount is non-zero
                if amount != 0 {self.updateSavingsView(withNewAmount: amount)}
            }
        }
    }
    
    
/// Update the savings label and progress view to the new amount specified in minor units.
    func updateSavingsView(withNewAmount minorUnits : Int) {
        
        guard let currentMinorUnits = dataManager.minorUnitsFromLabel(savingsLabel) else {return}
        
        let currentValue = CGFloat(currentMinorUnits)/100
        let newValue = CGFloat(minorUnits)/100
        
        savingsLabel.setUpdateBlock { value, label in
            label.text = String(format: "%.2f%", locale: Locale.current, value)
        }
        savingsLabel.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        savingsLabel.countFrom(currentValue, to: newValue, withDuration: Defaults.UI.labelUpdateTime)
        
        // Normalise saved amount to fit the progress bar range
        let progress = Double(minorUnits)/Double(Defaults.User.savingsGoalTarget)
        
        UIView.animate(withDuration: Defaults.UI.labelUpdateTime) {
            self.savingsProgressView.setProgress(Float(progress), animated: true)
        }
    }
    
    
/// Set up runtime interface properties for the savings goal card view.
    func setUpSavingsGoalView() {
        
        if let parentView = savingsGoalView.superview {
            parentView.layer.cornerRadius = Defaults.UI.viewCornerRadius
            parentView.layer.shadowColor = UIColor.darkGray.cgColor
            parentView.layer.shadowOffset = CGSize(width: 0, height: 10)
            parentView.layer.shadowRadius = Defaults.UI.shadowRadius
            parentView.layer.shadowOpacity = 0.4
        }
        savingsGoalView.layer.cornerRadius = Defaults.UI.viewCornerRadius
        savingsGoalView.clipsToBounds = true
    }
    
}
