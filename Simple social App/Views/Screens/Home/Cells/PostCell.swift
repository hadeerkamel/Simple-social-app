//
//  PostCell.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import UIKit

class PostCell: UICollectionViewCell {
    //MARK : - Outlets -
    @IBOutlet weak var posterNameLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    //MARK: - Properties
    var postData : PostModel!
    var ownerData : UserModel?
    var posterData : UserModel?
    

    //MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: - Helpers -

    func setModel(postModel:PostModel) {
         postData = nil
         ownerData = nil
         posterData = nil
        
        postData = postModel
        ownerData = UserPresistance.findUserWithID(id: postData.ownerID!)
        if postData.ownerID != postData.posterID{
        posterData = UserPresistance.findUserWithID(id: postData.posterID!)
        }
        poulateUI()
        
    }
    func poulateUI(){
        if postData != nil{
            bodyLabel.text = postData.body
            
        }
        if ownerData != nil {
            posterNameLabel.text = ownerData?.name
        }
        if posterData != nil{
            posterNameLabel.text = (posterData?.name)!+" Shared "+(ownerData?.name)! + "'s Post"
        }
    }
    //MARK: - Actions -
    
    @IBAction func shareButtonDidTapped(_ sender: UIButton) {
        BLPosts.share(postData: postData, ownerData: ownerData!, posterData: posterData)
    }
    
    
}
