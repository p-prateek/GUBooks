//
//  User+CoreDataClass.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    // Constructor
    convenience init(userId: Int16, dob: NSDate, email: String, address: String, major: String, gender: String, fname: String, lname: String, phone: String) {
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: CoreDataController.context)!
        
        self.init(entity: entity, insertInto: CoreDataController.context)
        
        self.address = address
        self.dob = dob
        self.email = email
        self.userId = userId
        self.gender = gender
        self.major = major
        self.fname = fname
        self.lname = lname
        self.phone = phone
        
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
    
    class func deleteUser(_ userId: Int16) {
        
        let user = getUser(userId)
        
        if(user != nil){
            CoreDataController.context.delete(user!)
            
            // Save Core data
            CoreDataController.saveContext()
        }
    }
    
    class func getUser(_ userId: Int16) -> User? {
        //retrieve data and print
        do {
            
            // request data
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            
            //get result
            let result = try CoreDataController.context.fetch(request)
            
            // assign result to print
            if(result.count > 0) {
                for item in result as! [NSManagedObject] {
                    let cduserId = item.value(forKey: "userId") as! Int16
                    if(cduserId == userId) {
                        let address = item.value(forKey: "address")
                        let dob = item.value(forKey: "dob")
                        let email = item.value(forKey: "email")
                        let userId = item.value(forKey: "userId")
                        let gender = item.value(forKey: "gender")
                        let major = item.value(forKey: "major")
                        let fname = item.value(forKey: "fname")
                        let lname = item.value(forKey: "lname")
                        let phone = item.value(forKey: "phone")
                        
                        print(userId!, fname!, lname!, dob!, gender!, email!, phone!, address!, major!)
                        
                        return item as? User
                    }
                }
            }
            else{
                print("Nothing Found", result.count)
            }
        }catch{
            print("User get Error")
            
        }
        
        return nil
    }
    
    func updateUser(phone: String?, address: String?, major: String?) {
        
        if (phone != nil) {
            self.phone = phone!
        }
        
        if (address != nil) {
            self.address = address!
        }
        
        if (major != nil) {
            self.major = major!
        }
        CoreDataController.saveContext()
    }

}
