//
//  File.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation

class BLlogin{
    
   //MARK: - Properties
    static var userID : Int?{
        set{
            UserDefaults.standard.setValue(newValue, forKey: "UserID")
            UserDefaults.standard.synchronize();
        }
        get{
            let val = UserDefaults.standard.object(forKey: "UserID")
            if val == nil {return nil}
            return (val as! Int)
        }
    }
    
    static var userInfo : UserModel!
    
   //MARK: - Dal callers -
    static func registerUser(with data : (name: String,email: String,Password:String,confirmPassword:String),callBack: @escaping (_ success: Bool,_ message: String?)->()){
        
        if let validationMessage = validateRegisterData(with: data){
            //return with the validation message
            callBack(false , validationMessage)
            
        }else{
            //send the data to dal to be send to presistance
            // if saved
            DalLogin.DalRegister(data: (name: data.name, email: data.email, password: data.Password))
            callBack(true,nil)
        }
        
        
    }
    
    static func loginUser(with data : (email: String,Password:String),callBack: @escaping (_ success: Bool,_ message: String?)->()){
        
        if let validationMessage = validateLoginData(with: data){
            
            callBack(false , validationMessage)
            
        }else{
           
            DalLogin.DalLogin(data: ( email: data.email, password: data.Password)){(isSuccess,message)in
                if isSuccess {
                    handleLoginSuccess(message: message!)
                }
                callBack(isSuccess,message)
            }
            
        }
        
        
    }

    static func logOut(){
        userID = nil
    }
    //MARK: - Validators
    static func validateRegisterData (with data : (name: String,email: String,Password:String,confirmPassword:String)) -> String? {
        
        var validationMessage : String?
        
        if data.name == ""{
            validationMessage = Messages.Validations.emptyName
        }
        else if data.name.characters.count < 3{
            validationMessage = Messages.Validations.shortName
        }else if !ValidationUtil.isValidEmail(testStr: data.email){
            validationMessage = Messages.Validations.incorrectEmail
        }
        else if data.Password.characters.count < 5{
            validationMessage = Messages.Validations.incorrectPassword
        }else if data.Password != data.confirmPassword {
            validationMessage = Messages.Validations.passwordsMatching
        }
        return validationMessage
    }
    
    static func validateLoginData (with data : (email: String,Password:String)) -> String? {
        
        var validationMessage : String?
        
         if !ValidationUtil.isValidEmail(testStr: data.email){
            validationMessage = Messages.Validations.incorrectEmail
        }
        else if data.Password.characters.count < 5{
            validationMessage = Messages.Validations.incorrectPassword
        }
        return validationMessage
    }
    //MARK: - handlers -
    static func  handleLoginSuccess(message:String){
        
        userID = Int(message)
        BLlogin.userInfo = UserPresistance.findUserWithID(id: userID!)
        
    }

}
