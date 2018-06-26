//
//  BLPosts.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/26/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation
class BLPosts{
    static func post(body:String){
        DalPosts.post(bodyText: body, ownerID: BLlogin.userID!)
    }
    static func share(postData :PostModel, ownerData :UserModel , posterData: UserModel?){
         ownerData.balance! += 5.0
       
        if posterData != nil {
           posterData?.balance = (posterData?.balance)! + 3
           BLlogin.userInfo.balance = BLlogin.userInfo.balance! + (0.02*3)
        }else{
           BLlogin.userInfo.balance = BLlogin.userInfo.balance! + (0.02*5)
        }
        
        DalPosts.sharePost(postData: postData,ownerData: ownerData,posterData: posterData)
    }
}
