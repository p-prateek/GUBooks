//
//  Account+CoreDataClass.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData

@objc(Account)
public class Account: NSManagedObject {
    // Constructor
    convenience init(userId: Int16, username: String, password: String, accountId: Int16) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Account", in: CoreDataController.context)!
        
        self.init(entity: entity, insertInto: CoreDataController.context)
        self.userId = userId
        self.username = username
        self.password = password
        self.accountId = accountId
        
        // Save Core data
        CoreDataController.saveContext()
        
        // insert to DB
        //DBConnector.orderSyncToDB(bookId, orderDate: orderDate, orderId: orderId, orderTime: orderTime, userId: userId)
        
        // update sync flag
        updateToSync(true)
    }
    
    fileprivate func updateToSync(_ isSync: Bool) {
        self.isSync = isSync
        
        // Save Core data
        CoreDataController.saveContext()
    }
    
    class func deleteAccount(_ accountId: Int16) {
        
        let account = getAccount(accountId)
        
        if(account != nil){
            CoreDataController.context.delete(account!)
            
            // Save Core data
            CoreDataController.saveContext()
        }
    }
    
    class func getAccount(_ accountId: Int16) -> Account? {
        //retrieve data and print
        do {
            
            // request data
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Account")
            
            //get result
            let result = try CoreDataController.context.fetch(request)
            
            // assign result to print
            if(result.count > 0) {
                for item in result as! [NSManagedObject] {
                    let cduserId = item.value(forKey: "accountId") as! Int16
                    if(cduserId == accountId) {
                        let isSync = item.value(forKey: "isSync")
                        let password = item.value(forKey: "password")
                        let username = item.value(forKey: "username")
                        let userId = item.value(forKey: "userId")
                        
                        print(userId!, username!, password!, isSync!)
                        
                        return item as? Account
                    }
                }
            }
            else{
                print("Nothing Found", result.count)
            }
        }catch{
            print("Account get Error")
            
        }
        
        return nil
    }
    
    func updateAccount(password: String) {
        self.password = password
        
        CoreDataController.saveContext()
    }
}
