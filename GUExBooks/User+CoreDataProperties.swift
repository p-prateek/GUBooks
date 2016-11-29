//
//  User+CoreDataProperties.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var address: String?
    @NSManaged public var dob: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var fname: String?
    @NSManaged public var gender: String?
    @NSManaged public var isSync: Bool
    @NSManaged public var lname: String?
    @NSManaged public var major: String?
    @NSManaged public var phone: String?
    @NSManaged public var userId: Int16

}
