//
//  HomeVC.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK : - Outlets -
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postsCollectionView: UICollectionView!
    //MARK : - Properties -
    var allPosts : [PostModel]!

    //MARK : - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializations()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateUI()
        loadAllPosts()
        postsCollectionView.reloadData()
    }
    //MARK : - Helpers -
    func populateUI(){
        if BLlogin.userInfo != nil {
            userNameLabel.text = BLlogin.userInfo.name
        }
        loadAllPosts()
    }
    func loadAllPosts(){
        
        allPosts = PostsPresistance.getAllPosts()
    }
    func initializations()
    {
        postsCollectionView.register(UINib(nibName: UIConstants.Cells.posts.rawValue, bundle: nil), forCellWithReuseIdentifier: UIConstants.Cells.posts.rawValue)

    }
    
    //MARK : - UIStyle -
    
  
    //MARK : - Actions -
    @IBAction func addPostButtonDidTapped(_ sender: UIButton) {
        self.present((self.storyboard?.instantiateViewController(withIdentifier: UIConstants.Screens.AddPost.rawValue))!, animated: true, completion: nil)
    }
    @IBAction func refreshButtonDidTapped(_ sender: UIButton) {
        
        loadAllPosts()
        postsCollectionView.reloadData()
        self.postsCollectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    
    

}
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if allPosts != nil{
            return allPosts.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = (postsCollectionView.frame.height-10)/2
        let cellWidth = postsCollectionView.frame.width
        return CGSize(width : cellWidth , height : cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = postsCollectionView.dequeueReusableCell(withReuseIdentifier: UIConstants.Cells.posts.rawValue, for: indexPath) as! PostCell
        cell.setModel(postModel: allPosts[indexPath.row])
        
        return cell
    }
    
}
