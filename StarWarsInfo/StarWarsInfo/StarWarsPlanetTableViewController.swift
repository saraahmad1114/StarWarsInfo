//
//  StarWarsPlanetTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsPlanetTableViewController: UITableViewController {

    let store = StarWarsPlanetsDataStore.sharedInstance
    
    override func viewDidLoad() {
        self.tableView.backgroundColor = UIColor.black
        super.viewDidLoad()
        self.store.getStarWarsPlanetsInformation(page: self.store.page) { (planetsArray) in
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
        return self.store.starWarsPlanetsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.store.starWarsPlanetsArray[indexPath.row].name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.store.starWarsPlanetsArray.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.store.page = self.store.page + 1
        self.store.getStarWarsPlanetsInformation(page: self.store.page) { (newArray) in
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
            })
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "planetSegue"{
//            if let destinationVC = segue.destination as? PlanetDetailViewController{
//                let neededIndexPath = self.tableView.indexPathForSelectedRow!
//                destinationVC.starWarsPlanetObject = self.store.starWarsPlanetsArray[neededIndexPath.row]
//            }
//
//        }
//    }
}

