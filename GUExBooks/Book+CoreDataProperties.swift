//
//  Book+CoreDataProperties.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book");
    }

    @NSManaged public var author: String?
    @NSManaged public var bookDescription: String?
    @NSManaged public var bookId: Int16
    @NSManaged public var edition: String?
    @NSManaged public var isbn: String?
    @NSManaged public var isSync: Bool
    @NSManaged public var picture: NSData?
    @NSManaged public var price: Float
    @NSManaged public var publishDate: NSDate?
    @NSManaged public var title: String?
    @NSManaged public var userId: Int16

}
