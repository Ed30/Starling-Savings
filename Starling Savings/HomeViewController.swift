//
//  ViewController.swift
//  Starling Savings
//
//  Created by Edward on 06/02/2020.
//  Copyright © 2020 Edward Theodor Danescu. All rights reserved.
//

import UIKit
import EFCountingLabel

class HomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeBackLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var balanceLabel:EFCountingLabel!
    @IBOutlet weak var roundupsLabel: EFCountingLabel!
    
    let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpProfileImage()
        
        apiManager.getClientName { (name) in
            self.updateWelcomeBackLabel(withName: name)
        }
        
        apiManager.getBalance(forAccountId: "403e74b2-7f26-4c78-8f76-353154fd8b63") { balance in
            self.updateBalanceLabel(withNewBalance: balance)
        }
        
        //{ balance in
            
        //    balanceLabel.text = balance
            
        //}
        
        
        
        
        
    }
    
    
    func updateWelcomeBackLabel(withName name : String) {
        let firstName = name.components(separatedBy: " ")[0]
        welcomeBackLabel.text = "Welcome Back\n\(firstName)"
    }
    
    
    func updateBalanceLabel(withNewBalance balance : Double) {
        
        balanceLabel.setUpdateBlock { value, label in
            label.text = String(format: "£%.2f%", locale: Locale.current, value)
        }
        
        balanceLabel.counter.timingFunction = EFTimingFunction.easeInOut(easingRate: 3)
        balanceLabel.countFrom(0, to: CGFloat(balance), withDuration: 1.0)
    }
    
    
    func updateRoundupsLabel() {
        
    }
    
    
    func setUpProfileImage() {
        
        let cornerRadius : CGFloat = 48
        
        if let parentView = profileImageView.superview {
            parentView.layer.cornerRadius = cornerRadius
            parentView.layer.shadowColor = UIColor.darkGray.cgColor
            parentView.layer.shadowOffset = .zero
            parentView.layer.shadowRadius = 30.0
            parentView.layer.shadowOpacity = 0.4
        }
        
        profileImageView.layer.cornerRadius = cornerRadius
        profileImageView.clipsToBounds = true
        print(profileImageView.bounds.size)
        
    }
    


}

