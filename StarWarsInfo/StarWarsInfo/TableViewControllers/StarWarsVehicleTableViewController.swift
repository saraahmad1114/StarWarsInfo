//
//  StarWarsVehicleTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsVehicleTableViewController: UITableViewController {

    //let store = StarWarsVehicleDataStore.sharedInstance
    
    var pageNum = 1
    var starWarsVehicleArray = [StarWarsVehicle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.backgroundColor = UIColor.black
//        self.store.getStarWarsVehicles(page: self.store.page) { (vehiclesArray) in
//            OperationQueue.main.addOperation {
//                self.tableView.reloadData()
//            }
//        }
        do {
            try StarWarsVehicleAPIClient.getStarWarsVehicleInformation(page: self.pageNum, completion: { (starWarVehicleArr) in
                OperationQueue.main.addOperation {
                    self.starWarsVehicleArray.append(contentsOf: starWarVehicleArr)
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
        return self.starWarsVehicleArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.starWarsVehicleArray[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.starWarsVehicleArray.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.pageNum = self.pageNum + 1
        do {
            try StarWarsVehicleAPIClient.getStarWarsVehicleInformation(page: self.pageNum, completion: { (starWarVehicleArr) in
                OperationQueue.main.addOperation {
                    self.starWarsVehicleArray.append(contentsOf: starWarVehicleArr)
                    self.tableView.reloadData()
                }
            })
        } catch let error{
            print("error is: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vehicleSegue"{
            if let desinationVC = segue.destination as? StarWarsVehicleDetailViewController{
                let neeededIndexPath = self.tableView.indexPathForSelectedRow
                desinationVC.vehicleObj = self.starWarsVehicleArray[(neeededIndexPath?.row)!]
            }
        }
    }
}

