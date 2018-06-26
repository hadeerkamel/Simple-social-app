//
//  AddPostVC.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController {
    //MARK : - Outlets - 
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postBodyTextView: UITextView!
    

    //MARK : - Life cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populateUI()
    }
    
    //MARK : - Helpers -
    func populateUI(){
        if BLlogin.userInfo != nil{
           userNameLabel.text = BLlogin.userInfo.name
        }
    }
    //MARK : - Actions -
    
    @IBAction func postButtonDidTapped(_ sender: UIButton) {
        if postBodyTextView.text != ""{
           BLPosts.post(body: postBodyTextView.text)
           self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    @IBAction func closeButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    
}
