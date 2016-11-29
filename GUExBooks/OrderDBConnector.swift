//
//  DBConnector.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/18/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import UIKit

class OrderDBConnector {
    
    fileprivate init() {
    }
    
    // MARK: - Order Functions
    class func orderSyncToDB(_ bookId: NSNumber, orderDate: Date,orderId: NSNumber,orderTime: String,userId: NSNumber) {
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost/order/guEx_order_Store.php")!)
        
        request.httpMethod = "POST"
        let postString = "a=\(bookId)&b=\(orderDate)&c=\(orderId)&d=\(orderTime)&e=\(userId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            if error != nil {
                print("error Order Insert =\(error)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        }) 
        task.resume()
    }
    
    class func orderDeleteFromDB(_ orderId: NSNumber) {
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost/order/guEx_order_Delete.php")!)
        
        request.httpMethod = "POST"
        let postString = "a=\(orderId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            if error != nil {
                print("error Order Insert =\(error)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        }) 
        task.resume()
    }
    
    // MARK: - Book Functions
    
    class func bookSyncToDB(_ bookId: NSNumber, userId: NSNumber, author: String?, bookDescription: String?, edition: String?, isbn: String, picture: Data?, price: NSNumber, publishDate: Date) {
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost/book/guEx_book_Store.php")!)
        
        request.httpMethod = "POST"
        let postString = "a=\(bookId)&b=\(userId)&c=\(author!)&d=\(bookDescription!)&e=\(edition!)&f=\(isbn)&&g=\(picture)&&h=\(price)&&i=\(publishDate)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            if error != nil {
                print("error Order Insert =\(error)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        }) 
        task.resume()
    }
    
    class func bookDeleteFromDB(_ bookId: NSNumber) {
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost/book/guEx_book_Delete.php")!)
        
        request.httpMethod = "POST"
        let postString = "a=\(bookId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            if error != nil {
                print("error Order Insert =\(error)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        }) 
        task.resume()
    }
    
    class func getAllBooksFromDB() -> NSArray{
        let url = URL(string: "http://localhost/book/guEx_book_GetAll.php")
        let data = try? Data(contentsOf: url!)
        let books = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        print("Data values count: \(books.count)")
        
        for item in books { // loop through data items
            let obj = item as! NSDictionary
            for (key, value) in obj {
                print(key, ":", value)
            }
        }
        
        return books
    }
    
    // MARK: - User Functions
    
    class func userSyncToDB(_ bookId: NSNumber, userId: NSNumber, author: String?, bookDescription: String?, edition: String?, isbn: String, picture: Data?, price: NSNumber, publishDate: Date) {
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost/book/guEx_book_Store.php")!)
        
        request.httpMethod = "POST"
        let postString = "a=\(bookId)&b=\(userId)&c=\(author!)&d=\(bookDescription!)&e=\(edition!)&f=\(isbn)&&g=\(picture)&&h=\(price)&&i=\(publishDate)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            if error != nil {
                print("error Order Insert =\(error)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        })
        task.resume()
    }
    
    class func userDeleteFromDB(_ bookId: NSNumber) {
        
        let request = NSMutableURLRequest(url: URL(string: "http://localhost/book/guEx_book_Delete.php")!)
        
        request.httpMethod = "POST"
        let postString = "a=\(bookId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
            data, response, error in
            
            if error != nil {
                print("error Order Insert =\(error)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        })
        task.resume()
    }

}
