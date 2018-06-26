//
//  PresistanceAccess.swift
//  Simple social App
//
//  Created by Hadeer Kamel on 6/25/18.
//  Copyright © 2018 Hadeer. All rights reserved.
//

import Foundation
import CoreData

struct PresistanceAccess{
    
    static var context: NSManagedObjectContext! = AppDelegate.appDelegate.persistentContainer.viewContext
    static func countRows(for fetchRequest : NSFetchRequest<NSManagedObject>)->Int{
        do {
            let count = try context.count(for:fetchRequest)
            return count
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            return 0
        }
    }
}

class UserPresistance{
    
    
    
    static func addUserRow(with userData : UserModel,pass password: String){
        
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        let numberOfRows = PresistanceAccess.countRows(for: request as! NSFetchRequest<NSManagedObject>)
        print("user Rows = \(numberOfRows)")
        
        
        let userItem = UserEntity(context : PresistanceAccess.context)
        userItem.id = Int32(numberOfRows+1)
        userItem.name = userData.name
        userItem.email = userData.email
        userItem.balance = userData.balance!
        userItem.password = password
        
        AppDelegate.appDelegate.saveContext()
        
    }
    static func findUser(with data : (email:String,password:String),callBack :@escaping(_ success: Bool,_ message: String?)->()){
        
        //try to find email
        do{
            
            
            let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
            request.predicate = NSPredicate(format: "email == %@" ,data.email)
            let matchedUsers = try PresistanceAccess.context.fetch(request)
            
            for user in matchedUsers{
                if user.password == data.password {
                    callBack(true,String(user.id))
                    return
                }
            }
            callBack(false,Messages.Authentications.wrongPassword )
            
        }catch{
            callBack(false,Messages.Authentications.emailNOtFound )
            
        }
        
        
    }
    
    static func findUserWithID(id:Int)-> UserModel?{
        do{
            let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %i" ,id)
            let matchedUsers = try PresistanceAccess.context.fetch(request)
            
            for user in matchedUsers{
                let userModel = UserModel(data: (name: user.name!, email: user.email!, balance: user.balance, id: Int(user.id)))
                return userModel
                
                
            }
            
        }catch{
            print(error)
        }
        return nil
    }
    static func updateBalance(for userID: Int,with balance: Double){
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %i" ,userID)
        do{
           let matchedUsers = try PresistanceAccess.context.fetch(request)
            for user in matchedUsers{
                user.setValue(balance, forKey: "balance")
                print(user)
                AppDelegate.appDelegate.saveContext()
                return
            }
        }catch{
            print(error)

        }
    }
}
class PostsPresistance{
    static func addPost(with body : String ,by ownerId : Int,to posterId : Int){
        
        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
        let numberOfRows = PresistanceAccess.countRows(for: request as! NSFetchRequest<NSManagedObject>)
        print("posts Rows = \(numberOfRows)")
        
        let item = PostEntity(context: PresistanceAccess.context)
        item.id = Int32(numberOfRows + 1)
        item.body = body
        item.ownerID = Int32(ownerId)
        item.posterID = Int32(posterId)
        
        AppDelegate.appDelegate.saveContext()
        
        
        //        do{
        //        let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
        //
        //        let allPosts = try PresistanceAccess.context.fetch(request)
        //            for post in allPosts{
        //
        //                print(post.body!)
        //            }
        //        }catch{
        //            print (error)
        //        }
        
    }
    static func getAllPosts()->[PostModel]?{
        
        var postsData = [PostModel]()
        do{
            let request: NSFetchRequest<PostEntity> = PostEntity.fetchRequest()
            
            let allPosts = try PresistanceAccess.context.fetch(request)
            for post in allPosts{
                
                let postModel = PostModel(data: (id: Int(post.id), body: post.body!, ownerID: Int(post.ownerID), posterID: Int(post.posterID)))
                postsData.append(postModel)
            }
            return postsData
        }catch{
            print(error)
            return nil
        }
        
    }
    
}
