//
//  ViewController.swift
//  Starling Savings
//
//  Created by Edward on 06/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import UIKit
import EFCountingLabel
import SPAlert

class HomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var balanceLabel:EFCountingLabel!
    @IBOutlet weak var roundupsLabel: EFCountingLabel!
    
    @IBOutlet weak var transferButton: UIButton!
    
    
    let apiManager = APIManager()
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpProfileImage()
        setUpTransferButton()
        
        getClientName()
        getBalanceAndRoundups()
        
    }
    
    
    @IBAction func transferButtonPressed(_ sender: Any) {
        
        guard let minorUnits = dataManager.minorUnitsFromLabel(roundupsLabel) else {return}
        
        apiManager.getFirstAccountAndDefaultCategory { accountId, _ in
            
            self.apiManager.addFundsToSavingsGoal(forAccountId: accountId, goalId: Defaults.User.savingsGoalId, amount: minorUnits) { success in
                
                if success {
                    Alert.done()
                    self.getBalanceAndRoundups()
                    Defaults.savingsScreenNeedsUpdate = true
                } else {
                    Alert.genericError()
                }
            }
        }
    }
    
    
    func getClientName() {
        apiManager.getClientName { (name) in
            self.updateWelcomeBackLabel(withName: name)
        }
    }
    
    func getBalanceAndRoundups() {
        
        apiManager.getFirstAccountAndDefaultCategory { accountId, categoryId in
            
            self.apiManager.getBalance(forAccountId: accountId) { balance in
                self.updateFigureLabel(self.balanceLabel, toNewAmount: balance)
                
            }
            
            self.apiManager.getThisWeeksTransactions(forAccountId: accountId, categoryId: categoryId) { transactions in
                let roundups = self.dataManager.newRoundupsFor(allTransactions: transactions)
                self.updateFigureLabel(self.roundupsLabel, toNewAmount: roundups)
            }
        }
    }
    
    
    func updateWelcomeBackLabel(withName name : String) {
        let firstName = name.components(separatedBy: " ")[0]
        welcomeBackLabel.text = "Welcome Back\n\(firstName)"
    }
    
    
    func updateFigureLabel(_ label : EFCountingLabel, toNewAmount minorUnits : Int) {
        
        guard let previousMinorUnits = dataManager.minorUnitsFromLabel(label) else {return}
        
        let previousValue = CGFloat(previousMinorUnits)/100
        let newValue = CGFloat(minorUnits)/100
        
        label.setUpdateBlock { value, label in
            label.text = String(format: "£%.2f%", locale: Locale.current, value)
        }
        label.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        label.countFrom(previousValue, to: newValue, withDuration: Defaults.UI.labelUpdateTime)
    }
    
    
    func setUpTransferButton() {
        
        transferButton.layer.cornerRadius = Defaults.UI.viewCornerRadius
        transferButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        let imageSpacing : CGFloat = 70
        let titleSpacing : CGFloat = 20
        transferButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageSpacing)
        transferButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: titleSpacing)
    }
    
    
    func setUpProfileImage() {
        
        if let parentView = profileImageView.superview {
            parentView.layer.cornerRadius = Defaults.UI.profileImageCornerRadius
            parentView.layer.shadowColor = UIColor.darkGray.cgColor
            parentView.layer.shadowOffset = .zero
            parentView.layer.shadowRadius = 25.0
            parentView.layer.shadowOpacity = 0.5
        }
        
        profileImageView.layer.cornerRadius = Defaults.UI.profileImageCornerRadius
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 0.8
    }

    
}

