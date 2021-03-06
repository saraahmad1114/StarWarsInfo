//
//  StarWarsStarshipTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsStarshipTableViewController: UITableViewController {

    var pageNum = 1
    var starWarsStarshipArr = [StarWarsStarship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
        do {
            try StarWarsStarshipsAPIClient.getStarWarsStarshipsInformation(page: self.pageNum, completion: { (starShipArray) in
                OperationQueue.main.addOperation {
                    self.starWarsStarshipArr.append(contentsOf: starShipArray)
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
        return self.starWarsStarshipArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.starWarsStarshipArr[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.starWarsStarshipArr.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.pageNum = self.pageNum + 1
        do {
            try StarWarsStarshipsAPIClient.getStarWarsStarshipsInformation(page: self.pageNum, completion: { (starShipNextArray) in
                OperationQueue.main.addOperation {
                    self.starWarsStarshipArr.append(contentsOf: starShipNextArray)
                    self.tableView.reloadData()
                }
            })
        } catch let error{
            print("error is: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "starshipSegue"{
            if let destinationVC = segue.destination as? StarWarsStarshipDetailViewController{
                let neededIndexPath = self.tableView.indexPathForSelectedRow!
                destinationVC.starShipObject = self.starWarsStarshipArr[neededIndexPath.row]
            }
        }
    }
}
