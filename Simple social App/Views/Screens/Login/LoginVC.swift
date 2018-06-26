//
//  LoginVC.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK : - Outlets -
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK : - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK : - Actions -
    @IBAction func loginButtonDidTapped(_ sender: UIButton) {
        BLlogin.loginUser(with: (email: emailTextField.text!, Password: passwordTextField.text!)){
            (isSuccess,message)in
            
            if isSuccess{
                self.dismiss(animated: false, completion: nil)
                self.present(UIConstants.Storyboards.homeStory.instantiateInitialViewController()!, animated: true, completion: nil)
                
            }else{
                //print the message
            }
            
            }
        
       
    }
    @IBAction func registerButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        present(UIConstants.Storyboards.loginStory.instantiateViewController(withIdentifier: UIConstants.Screens.Register.rawValue), animated: true, completion: nil)
        
    }
}
