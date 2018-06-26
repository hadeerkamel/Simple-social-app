//
//  DalLogin.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation

class DalLogin{
    
    static func DalRegister(data : (name: String,email: String,password:String)){
        
        let userModel = UserModel(data: (name:data.name , email: data.email, balance: Double(0.0), id: 0))
        UserPresistance.addUserRow(with: userModel, pass: data.password)
    }
    static func DalLogin(data : (email: String,password:String),callBack :@escaping(_ success: Bool,_ message: String?)->()){
        
        UserPresistance.findUser(with: data){(isSuccess , message) in
            
            callBack(isSuccess,message)
            
            
        }

        
    }
    
    
}
