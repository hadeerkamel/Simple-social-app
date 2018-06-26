//
//  PostModel.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/26/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation
class PostModel {
    var id       : Int?
    var body     : String?
    var ownerID  : Int?
    var posterID : Int?
    
    init(data : (id:Int ,body: String,ownerID:Int,posterID:Int)){
        id = data.id
        body = data.body
        ownerID = data.ownerID
        posterID = data.posterID
    }
}
