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
        
        apiManager.getFirstAccountAndDefaultCategory { (accountId, _) in
            self.apiManager.getSavingsGoalAmount(forAccountId: accountId, goalId: self.dataManager.savingsGoalId) { (amount) in
                
                if amount != 0 {self.updateSavings(withNewAmount: amount)}
                
            }
        }
    }
    
    
    
    func updateSavings(withNewAmount amount : Double) {
        
        savingsLabel.setUpdateBlock { value, label in
            label.text = String(format: "%.2f%", locale: Locale.current, value)
        }
        
        savingsLabel.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        savingsLabel.countFrom(0, to: CGFloat(amount), withDuration: 1.0)
        
        let progress = amount/1000
        
        UIView.animate(withDuration: 1.0) {
            self.savingsProgressView.setProgress(Float(progress), animated: true)
        }
        
        
    }
    
    func setUpSavingsGoalView() {
        
        let cornerRadius : CGFloat = 15
                
                if let parentView = savingsGoalView.superview {
                    parentView.layer.cornerRadius = cornerRadius
                    parentView.layer.shadowColor = UIColor.darkGray.cgColor
                    parentView.layer.shadowOffset = CGSize(width: 0, height: 10)
                    parentView.layer.shadowRadius = 25.0
                    parentView.layer.shadowOpacity = 0.5
                }
                
                savingsGoalView.layer.cornerRadius = cornerRadius
                savingsGoalView.clipsToBounds = true

        
    }
    
}
