//
//  Payment+CoreDataProperties.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData


extension Payment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Payment> {
        return NSFetchRequest<Payment>(entityName: "Payment");
    }

    @NSManaged public var amount: Float
    @NSManaged public var bookId: Int16
    @NSManaged public var isSync: Bool
    @NSManaged public var method: String?
    @NSManaged public var paymentDate: NSDate?
    @NSManaged public var paymentId: Int16
    @NSManaged public var paymentTime: String?
    @NSManaged public var userId: Int16

}
