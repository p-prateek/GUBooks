//
//  ViewController.swift
//  GUExBooks
//
//  Created by Anas Alghanmi on 11/14/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let currentTime = String(Calendar.current.component(.hour, from: Date())) + ":" + String(Calendar.current.component(.minute, from: Date())) + ":" + String(Calendar.current.component(.second, from: Date()))
        
        //print(currentTime)
        
        // Add orders
        //_ = Order(bookId: 5, orderDate: NSDate(), orderId: 3, orderTime: "03:43:22", userId: 4)
        
        //_ = Order(bookId: 6, orderDate: Date(), orderId: 4, orderTime: "14:00:00", userId: 5)
        
        //_ = Order(bookId: 7, orderDate: Date(), orderId: 5, orderTime: "15:00:00", userId: 6)
        
        // print orders
        //_ = Order.getOrder(3)
        
        //_ = Order.getOrder(4)
        
        //_ = Order.getOrder(5)
        
        // delete order
        //Order.deleteOrder(3)
        
        // delete order
        //Order.deleteOrder(4)
        
        // delete order
        //Order.deleteOrder(5)
        
        // Add books
        //_ = Book(bookId: 8, userId: 5, author: "Anas Alghanmi", bookDescription: "HELLO", edition: "1782th", isbn: "287648276", picture: NSData(), price: 12.54, publishDate: NSDate(), title: "SAMPLE")
        
        //_ = Book.getBook(8)
        
        //Book.deleteBook(8)
        
        //_ = DBConnector.getAllBooksFromDB()
        
        // Add payment
        
        //_ = Payment(bookId: 1, paymentDate: NSDate(), paymentId: 3, paymentTime: "03:29:19", userId: 1, amount: 19.49, method: "CASH")
        
        //_ = Payment.getPayment(3)
        
        //_ = Payment.deletePayment(3)
        
        // Add User
        
        //_ = User(userId: 1, dob: NSDate(), email: "t@t.com", address: "2365 wijd", major: "CIS", gender: "M", fname: "Anas", lname: "Alghanmi", phone: "814-329-1298")
        
        //let user = User.getUser(1)
        
        //user?.updateUser(phone: nil, address: "dslijode", major: "GCIS")
        
        //_ = User.getUser(1)
        
        //_ = User.deleteUser(1)
        
        // Add Account
        
        //_ = Account(userId: 1, username: "askjhg218", password: "ASD9327", accountId: 1)
        
        //let account = Account.getAccount(1)
        
        //account?.updateAccount(password: "new password")
        
        //_ = Account.getAccount(1)
        
        //_ = Account.deleteAccount(1)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

