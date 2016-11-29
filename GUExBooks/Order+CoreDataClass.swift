//
//  Order+CoreDataClass.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData

@objc(Order)
public class Order: NSManagedObject {
    // Constructor
    convenience init(bookId: Int16, orderDate: NSDate,orderId: Int16,orderTime: String,userId: Int16) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Order", in: CoreDataController.context)!
        
        self.init(entity: entity, insertInto: CoreDataController.context)
        
        self.bookId = bookId
        self.orderDate = orderDate
        self.orderId = orderId
        self.orderTime = orderTime
        self.userId = userId
        
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
    
    class func deleteOrder(_ orderId: Int16) {
        
        let order = getOrder(orderId)
        
        if(order != nil){
            CoreDataController.context.delete(order!)
            
            // Save Core data
            CoreDataController.saveContext()
        }
    }
    
    class func getOrder(_ orderId: Int16) -> Order? {
        //retrieve data and print
        do {
            
            // request data
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Order")
            
            //get result
            let result = try CoreDataController.context.fetch(request)
            
            // assign result to print
            if(result.count > 0) {
                for item in result as! [NSManagedObject] {
                    let cdorderId = item.value(forKey: "orderId") as! Int16
                    if(cdorderId == orderId) {
                        let bookId = item.value(forKey: "bookId")
                        let isSync = item.value(forKey: "isSync")
                        let orderDate = item.value(forKey: "orderDate")
                        let orderTime = item.value(forKey: "orderTime")
                        let userId = item.value(forKey: "userId")
                        
                        print(bookId!, isSync!, orderDate!, orderId, orderTime!, userId!)
                        
                        return item as? Order
                    }
                }
            }
            else{
                print("Nothing Found", result.count)
            }
        }catch{
            print("Order get Error")
            
        }
        
        return nil
    }

}
