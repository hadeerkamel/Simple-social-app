//
//  ProfileVC.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/26/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet weak var userNamelabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    //MARK: - Life cycle -

   /* override func viewDidLoad() {
        super.viewDidLoad()
        populateUI()
        
    }*/
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateUI()
    }
    //MARK: - Helpers - 
    func populateUI(){
        userNamelabel.text = BLlogin.userInfo.name
        balanceLabel.text = String(format :"%.3f" ,BLlogin.userInfo.balance!)
    }
    //MARK: - Actions -
    
    @IBAction func logoutButtonDidTapped(_ sender: Any) {
        BLlogin.logOut()
        self.dismiss(animated: false, completion: nil)
        self.dismiss(animated: false, completion: nil)
        self.present(UIConstants.Storyboards.loginStory.instantiateInitialViewController()!, animated: true, completion: nil)
    }
    

   
}
