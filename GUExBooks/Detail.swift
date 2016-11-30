//
//  Detail.swift
//  GUExBooks
//
//  Created by Balasubramanian, Srinivas B on 11/29/16.
//  Copyright © 2016 Gannon. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    var detailBooks: Books? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailBooks = detailBooks {
            if let detailDescriptionLabel = detailDescriptionLabel {
                detailDescriptionLabel.text = detailBooks.name
                title = detailBooks.category
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

