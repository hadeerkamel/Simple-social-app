//
//  MessageManager.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/26/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation
import BRYXBanner


func showMessageBanner(title: String, subTitle: String = "",error:Bool = false) {
    
    let banner = Banner(title: title, subtitle: subTitle, image: nil, backgroundColor: error ? #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
    banner.alpha = 0.9
    //banner.titleLabel.font = UIFont(name:  , size: 16)
    banner.dismissesOnTap = true
    banner.show(duration: 3.0)
    
}

