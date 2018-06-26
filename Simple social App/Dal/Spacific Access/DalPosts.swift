//
//  DalPosts.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/26/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation
class DalPosts {
    static func post(bodyText : String,ownerID : Int){
        PostsPresistance.addPost(with: bodyText, by: ownerID,to:ownerID)
    }
    static func sharePost(postData : PostModel ,ownerData:UserModel,posterData:UserModel?){
        //update balances
        UserPresistance.updateBalance(for: BLlogin.userInfo.iD!, with: BLlogin.userInfo.balance!)
        UserPresistance.updateBalance(for: ownerData.iD!, with: ownerData.balance!)
        if posterData != nil{
            UserPresistance.updateBalance(for: (posterData?.iD)!, with: (posterData?.balance)!)
        }
        //addPost
        PostsPresistance.addPost(with: postData.body!, by: ownerData.iD!, to: BLlogin.userInfo.iD!)
    }
}
