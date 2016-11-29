//
//  Order+CoreDataProperties.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order");
    }

    @NSManaged public var bookId: Int16
    @NSManaged public var isSync: Bool
    @NSManaged public var orderDate: NSDate?
    @NSManaged public var orderId: Int16
    @NSManaged public var orderTime: String?
    @NSManaged public var userId: Int16

}
