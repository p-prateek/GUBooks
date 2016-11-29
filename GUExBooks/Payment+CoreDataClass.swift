//
//  Payment+CoreDataClass.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData

@objc(Payment)
public class Payment: NSManagedObject {
    
    // Constructor
    convenience init(bookId: Int16, paymentDate: NSDate,paymentId: Int16,paymentTime: String,userId: Int16, amount: Float, method: String) {
        
        let entity = NSEntityDescription.entity(forEntityName: "Payment", in: CoreDataController.context)!
        
        self.init(entity: entity, insertInto: CoreDataController.context)
        
        self.paymentDate = paymentDate
        self.paymentId = paymentId
        self.userId = userId
        self.paymentTime = paymentTime
        self.amount = amount
        self.bookId = bookId
        self.method = method
        
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
    
    class func deletePayment(_ paymentId: Int16) {
        
        let payment = getPayment(paymentId)
        
        if(payment != nil){
            CoreDataController.context.delete(payment!)
            
            // Save Core data
            CoreDataController.saveContext()
        }
    }
    
    class func getPayment(_ paymentId: Int16) -> Payment? {
        //retrieve data and print
        do {
            
            // request data
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Payment")
            
            //get result
            let result = try CoreDataController.context.fetch(request)
            
            // assign result to print
            if(result.count > 0) {
                for item in result as! [NSManagedObject] {
                    let cdpaymentId = item.value(forKey: "paymentId") as! Int16
                    if(cdpaymentId == paymentId) {
                        let bookId = item.value(forKey: "bookId")
                        let isSync = item.value(forKey: "isSync")
                        let method = item.value(forKey: "method")
                        let paymentTime = item.value(forKey: "paymentTime")
                        let userId = item.value(forKey: "userId")
                        let paymentDate = item.value(forKey: "paymentDate")
                        let amount = item.value(forKey: "amount")
                        let paymentId = item.value(forKey: "paymentId")
                        
                        print(bookId!, isSync!, paymentDate!, paymentId!, paymentTime!, userId!, method!, amount!)
                        
                        return item as? Payment
                    }
                }
            }
            else{
                print("Nothing Found", result.count)
            }
        }catch{
            print("Payment get Error")
            
        }
        
        return nil
    }
    

}
