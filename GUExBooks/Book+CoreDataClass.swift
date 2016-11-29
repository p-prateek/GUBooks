//
//  Book+CoreDataClass.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/24/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import Foundation
import CoreData

@objc(Book)
public class Book: NSManagedObject {
    // Constructor
    convenience init(bookId: Int16, userId: Int16, author: String?, bookDescription: String?, edition: String?, isbn: String, picture: NSData?, price: Float, publishDate: NSDate, title: String?) {
    
        let entity = NSEntityDescription.entity(forEntityName: "Book", in: CoreDataController.context)!
        
        self.init(entity: entity, insertInto: CoreDataController.context)
        
        self.bookId = bookId
        self.userId = userId
        self.author = author
        self.bookDescription = bookDescription
        self.edition = edition
        self.isbn = isbn
        self.picture = picture
        self.price = price
        self.publishDate = publishDate
        self.title = title
        
        // Save Core data
        CoreDataController.saveContext()
        
        // insert to DB
        //DBConnector.bookSyncToDB(bookId, userId: userId, author: author, bookDescription: bookDescription, edition: edition, isbn: isbn, picture: picture, price: price, publishDate: publishDate)
        
        // update sync flag
        updateToSync(true)
    }
    
    fileprivate func updateToSync(_ isSync: Bool) {
        self.isSync = isSync
        
        // Save Core data
        CoreDataController.saveContext()
    }
    
    class func deleteBook(_ bookId: Int16!) {
        
        let book = getBook(bookId)
        
        if(book != nil){
            CoreDataController.context.delete(book!)
            
            // Save Core data
            CoreDataController.saveContext()
        }
    }
    
    class func getBook(_ bookId: Int16) -> Book? {
        //retrieve data and print
        do {
            
            // request data
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Book")
            
            //get result
            let result = try CoreDataController.context.fetch(request)
            
            // assign result to print
            if(result.count > 0) {
                for item in result as! [NSManagedObject] {
                    let cdBookId = item.value(forKey: "bookId") as! Int16
                    if(cdBookId == bookId) {
                        let bookId = item.value(forKey: "bookId")
                        let isSync = item.value(forKey: "isSync")
                        let userId = item.value(forKey: "userId")
                        let author = item.value(forKey: "author")
                        let bookDescription = item.value(forKey: "bookDescription")
                        let edition = item.value(forKey: "edition")
                        let isbn = item.value(forKey: "isbn")
                        _ = item.value(forKey: "picture")
                        let price = item.value(forKey: "price")
                        let publishDate = item.value(forKey: "publishDate")
                        let title = item.value(forKey: "title")
                        
                        //print(bookId!, isSync!, userId!, author, bookDescription, edition,isbn!, picture, price!, publishDate!)
                        
                        print(bookId!, isSync!, userId!, author!, bookDescription!, edition!,isbn!, price!, publishDate!, title!)
                        
                        return item as? Book
                    }
                }
            }
            else{
                print("Nothing Found", result.count)
            }
        }catch{
            print("Book get Error")
            
        }
        
        return nil
    }
    
    func updateBook(bookDescription: String?, price: Float?) {
        
        if (price != nil) {
            self.price = price!
        }
        
        if (bookDescription != nil) {
            self.bookDescription = bookDescription!
        }
        
        CoreDataController.saveContext()
    }

}
