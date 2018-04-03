//
//  StarWarsPlanetTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsPlanetTableViewController: UITableViewController {

    //let store = StarWarsPlanetsDataStore.sharedInstance
    var pageNum = 1
    var starWarsPlanetArr = [StarWarsPlanet]()
    
    override func viewDidLoad() {
        self.tableView.backgroundColor = UIColor.black
        super.viewDidLoad()
        do {
            try StarWarsPlanetsAPIClient.getStarWarsPlanetsInformation(page: self.pageNum, completion: { (starWarsPlanetsInfo) in
                OperationQueue.main.addOperation {
                    self.starWarsPlanetArr.append(contentsOf: starWarsPlanetsInfo)
                    self.tableView.reloadData()
                }
            })
        } catch let error{
            print("error is: \(error.localizedDescription)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.starWarsPlanetArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.starWarsPlanetArr[indexPath.row].name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.starWarsPlanetArr.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.pageNum = self.pageNum + 1
        do {
            try StarWarsPlanetsAPIClient.getStarWarsPlanetsInformation(page: self.pageNum, completion: { (starWarsPlanetsInfo) in
                OperationQueue.main.addOperation {
                    self.starWarsPlanetArr.append(contentsOf: starWarsPlanetsInfo)
                    self.tableView.reloadData()
                }
            })
        } catch let error{
            print("error is: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "planetSegue"{
            if let destinationVC = segue.destination as? StarWarsPlanetDetailViewController{
                let neededIndexPath = self.tableView.indexPathForSelectedRow!
                destinationVC.starWarsPlanetObject = self.starWarsPlanetArr[neededIndexPath.row]
            }
        }
    }
}

