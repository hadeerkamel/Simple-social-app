//
//  UIConstants.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation
import UIKit
class UIConstants {
    
    enum Screens : String {
        case Login       = "LoginVC"
        case Register    = "RegisterVC"
        case Home        = "HomeVC"
        case AddPost     = "AddPostVC"
    }
    enum Cells : String {
        case posts    = "PostCell"
    }
    struct Storyboards {
        static var loginStory     = UIStoryboard (name: "Login", bundle:.main)
        static var homeStory      = UIStoryboard (name: "Home" , bundle:.main)
    }
}
