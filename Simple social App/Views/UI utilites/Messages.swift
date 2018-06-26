//
//  File.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation

class Messages {
    
    struct Validations {
        static var emptyName         = "Please enter your name"
        static var shortName         = "Your name shouldn't be less than 3 charachters"
        static var incorrectEmail    = "please enter a valide Email"
        static var incorrectPassword = "Your password shouldn't be less than 5 charachters"
        static var passwordsMatching = "Please check the passwords matching"
        
    }
    struct Authentications{
        static var wrongPassword       = "Wrong password"
        static var emailNOtFound       = "This email is not exist"
        static var registrationSucces  = "Congrats!\nYour data saved successfuly"
    }
    
}
