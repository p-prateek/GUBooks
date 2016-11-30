//
//  SearchMasterViewController.swift
//  GUExBooks
//
//  Created by Balasubramanian, Srinivas B on 11/29/16.
//  Copyright © 2016 Gannon. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    // MARK: - Properties
    var detailViewController: DetailViewController? = nil
    var books = [Books]()
    var filteredBooks = [Books]()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        // Setup the categoreis bar
        searchController.searchBar.scopeButtonTitles = ["All", "Title", "Subject", "Price"]
        tableView.tableHeaderView = searchController.searchBar
        
        books = [
            Books(category:"Title", name:"Swift"),
            Books(category:"Price", name:"Objective C"),
            Books(category:"Title", name:"Data Centric"),
            Books(category:"Price", name:"Software Requirements")]
        
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredBooks.count
        }
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let book: Books
        if searchController.isActive && searchController.searchBar.text != "" {
            book = filteredBooks[indexPath.row]
        } else {
            book = books[indexPath.row]
        }
        cell.textLabel!.text = book.name
        cell.detailTextLabel?.text = book.category
        return cell
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredBooks = books.filter({( book : Books) -> Bool in
            let categoryMatch = (scope == "All") || (book.category == scope)
            return categoryMatch && book.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let book: Books
                
                if searchController.isActive && searchController.searchBar.text != "" {
                    book = filteredBooks[indexPath.row]
                } else {
                    book = books[indexPath.row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailBooks = book
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}

extension MasterViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension MasterViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
}
