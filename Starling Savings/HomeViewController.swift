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

/**
 Home View Controller containing the main information such as customer name, profile image,
 as well as available balance and roundups for the current week.
 It also contains a transfer button enabling the user to transfer the roundups to a savings goal.
 */
class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var balanceLabel:EFCountingLabel!
    @IBOutlet weak var roundupsLabel: EFCountingLabel!
    
    @IBOutlet weak var transferButton: UIButton!
    
    let apiManager = APIManager()
    let dataManager = DataManager()
    
    
/// Called when the view was loaded. Load data and setup interface elements.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpProfileImage()
        setUpTransferButton()
        
        getClientName()
        getBalanceAndRoundups()
    }
    

/// Responder for touch up inside. Calls API methods to transfer the roundup amount to the savings goal.
    @IBAction func transferButtonPressed(_ sender: Any) {
        
        //Get the value of the roundups label
        guard let minorUnits = dataManager.minorUnitsFromLabel(roundupsLabel) else {return}
        
        apiManager.getFirstAccountAndDefaultCategory { accountId, _ in
            
            self.apiManager.addFundsToSavingsGoal(forAccountId: accountId, goalId: Defaults.User.savingsGoalId, amount: minorUnits) { success in
                
                if success {
                    Alert.done()
                    self.getBalanceAndRoundups()//Refresh figures
                    Defaults.savingsScreenNeedsUpdate = true
                } else {
                    Alert.genericError()
                }
            }
        }
    }
    
    
/// Call API method to get client's name and update the welcome label.
    func getClientName() {
        apiManager.getClientName { (name) in
            self.updateWelcomeBackLabel(withName: name)
        }
    }
    
    
/// Call API and Data Manager methods to retrieve balance and weekly transactions and to compute roundups. Update respective labels.
    func getBalanceAndRoundups() {
        
        apiManager.getFirstAccountAndDefaultCategory { accountId, categoryId in
            
            self.apiManager.getBalance(forAccountId: accountId) { balance in
                self.updateFigureLabel(self.balanceLabel, toNewAmount: balance)
            }
            
            self.apiManager.getThisWeeksTransactions(forAccountId: accountId, categoryId: categoryId) { transactions in
                let roundups = self.dataManager.newRoundups(forTransactions: transactions)
                self.updateFigureLabel(self.roundupsLabel, toNewAmount: roundups)
            }
        }
    }
    
    
/// Update the welcome back label with a given name.
    func updateWelcomeBackLabel(withName name : String) {
        let firstName = name.components(separatedBy: " ")[0]
        welcomeBackLabel.text = "Welcome Back\n\(firstName)"
    }
    
    
/// Update the specified figure label to the new amount specified in minor units.
    func updateFigureLabel(_ label : EFCountingLabel, toNewAmount minorUnits : Int) {
        
        guard let currentMinorUnits = dataManager.minorUnitsFromLabel(label) else {return}
        
        let currentValue = CGFloat(currentMinorUnits)/100 // Label will count from its current value
        let newValue = CGFloat(minorUnits)/100            // Up to the new specified value
        
        label.setUpdateBlock { value, label in
            label.text = String(format: "£%.2f%", locale: Locale.current, value)
        }
        label.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        label.countFrom(currentValue, to: newValue, withDuration: Defaults.UI.labelUpdateTime)
    }
    
    
/// Set up runtime interface properties for the transfer button.
    func setUpTransferButton() {
        
        transferButton.layer.cornerRadius = Defaults.UI.viewCornerRadius
        transferButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        let imageSpacing : CGFloat = 70
        let titleSpacing : CGFloat = 20
        transferButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageSpacing)
        transferButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: titleSpacing)
    }
    
    
/// Set up runtime interface properties for the profile image view.
    func setUpProfileImage() {
        
        if let parentView = profileImageView.superview {
            parentView.layer.cornerRadius = Defaults.UI.profileImageCornerRadius
            parentView.layer.shadowColor = UIColor.darkGray.cgColor
            parentView.layer.shadowOffset = .zero
            parentView.layer.shadowRadius = Defaults.UI.shadowRadius
            parentView.layer.shadowOpacity = 0.5
        }
        profileImageView.layer.cornerRadius = Defaults.UI.profileImageCornerRadius
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 0.8
    }

}

