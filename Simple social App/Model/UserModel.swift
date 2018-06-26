//
//  UserModel.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation

class UserModel {
    var iD     : Int?
    var name   : String?
    var email  : String?
    var balance: Double?
    
    init(data : (name: String,email: String,balance:Double,id:Int)) {
        iD = data.id
        name = data.name
        email = data.email
        balance = data.balance
    }
    
}
