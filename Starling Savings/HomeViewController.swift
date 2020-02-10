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
        // Do any additional setup after loading the view.
        
        setUpProfileImage()
        setUpTransferButton()
        
        
        apiManager.getClientName { (name) in
            self.updateWelcomeBackLabel(withName: name)
        }
                
        apiManager.getFirstAccountAndDefaultCategory { accountId, categoryId in
            
            self.apiManager.getBalance(forAccountId: accountId) { balance in
                self.updateBalanceLabel(withNewBalance: balance)
            }
            
            self.apiManager.getWeekOutboundTransactionAmounts(forAccountId: accountId, categoryId: categoryId) { amounts in
                let roundups = self.dataManager.aggregateRoundups(forMinorUnits: amounts)
                self.updateRoundupsLabel(withNewAmount: roundups)
            }
            
        }
    }
    
    
    @IBAction func transferButtonPressed(_ sender: Any) {
        
        
        
        SPAlert.present(title: "Done", preset: .done)
        
        
        
    }
    
    
    
    func updateWelcomeBackLabel(withName name : String) {
        let firstName = name.components(separatedBy: " ")[0]
        welcomeBackLabel.text = "Welcome Back\n\(firstName)"
//        welcomeBackLabel.textColor = #colorLiteral(red: 0.4156862745, green: 0.2588235294, blue: 0.9607843137, alpha: 1)
    }
    
    
    func updateBalanceLabel(withNewBalance balance : Double) {
        
        balanceLabel.setUpdateBlock { value, label in
            label.text = String(format: "£%.2f%", locale: Locale.current, value)
        }
        balanceLabel.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        balanceLabel.countFrom(0, to: CGFloat(balance), withDuration: 1.0)
    }
    
    
    func updateRoundupsLabel(withNewAmount amount : Double) {
        
        roundupsLabel.setUpdateBlock { value, label in
            label.text = String(format: "£%.2f%", locale: Locale.current, value)
        }
        roundupsLabel.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        roundupsLabel.countFrom(0, to: CGFloat(amount), withDuration: 1.0)
    }
    
    
    func setUpTransferButton() {
        
        transferButton.layer.cornerRadius = 15
        
        transferButton.setTitleColor(UIColor.lightGray, for: .highlighted)
        
        let spacing : CGFloat = 70 // the amount of spacing to appear between image and title
        transferButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        transferButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        
    }
    
    func setUpProfileImage() {
        
        let cornerRadius : CGFloat = 48
        
        if let parentView = profileImageView.superview {
            parentView.layer.cornerRadius = cornerRadius
            parentView.layer.shadowColor = UIColor.darkGray.cgColor
//            parentView.layer.shadowColor = #colorLiteral(red: 0.4156862745, green: 0.2588235294, blue: 0.9607843137, alpha: 1)
            parentView.layer.shadowOffset = .zero
            parentView.layer.shadowRadius = 25.0
            parentView.layer.shadowOpacity = 0.5
        }
        
        profileImageView.layer.cornerRadius = cornerRadius
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 0.8
        print(profileImageView.bounds.size)
        
    }
    


}

