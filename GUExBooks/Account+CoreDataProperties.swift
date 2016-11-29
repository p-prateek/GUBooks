//
//  Account+CoreDataProperties.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account");
    }

    @NSManaged public var accountId: Int16
    @NSManaged public var password: String?
    @NSManaged public var userId: Int16
    @NSManaged public var username: String?
    @NSManaged public var isSync: Bool

}
