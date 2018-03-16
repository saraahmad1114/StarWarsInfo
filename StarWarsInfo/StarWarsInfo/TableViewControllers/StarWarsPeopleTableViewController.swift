//
//  StarWarsPeopleTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsPeopleTableViewController: UITableViewController {
    
    let store = StarWarsPeopleDataStore.sharedInstance
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
        self.store.getStarWarsPeopleInformation(page: self.store.page) { (starwarsPeopleArray) in
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.store.starWarsPeopleArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.store.starWarsPeopleArray[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.store.starWarsPeopleArray.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.store.page = self.store.page + 1
        self.store.getStarWarsPeopleInformation(page: self.store.page) { (newArray) in
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "peopleDetailSegue"{
            if let destinationVC = segue.destination as? StarWarsPersonDetailViewController {
                let neededIndexPath = self.tableView.indexPathForSelectedRow!
                destinationVC.starWarsPeopleObject = self.store.starWarsPeopleArray[neededIndexPath.row]
            }
        }
    }
}
