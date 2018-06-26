//
//  RegisterVC.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    //MARK : - Outlets -
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTExtField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    //MARK : - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK : - Actions -
    
    @IBAction func submitButtonDidTapped(_ sender: UIButton) {
        BLlogin.registerUser(with: (name: nameTextField.text!, email: emailTExtField.text!, Password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!)){(success,message)in
            if success{
                //show message with registration successd
                   //open login screen
                self.dismiss(animated: true, completion: nil)
            }else{
                //show message
            }
            
        }
    }
    
}
