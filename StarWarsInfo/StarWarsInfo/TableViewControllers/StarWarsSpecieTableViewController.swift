//
//  StarWarsSpecieTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsSpecieTableViewController: UITableViewController {

    var pageNum = 1
    var starWarsSpeciesArr = [StarWarsSpecies]()
    
    override func viewDidLoad() {
        self.tableView.backgroundColor = UIColor.black
        super.viewDidLoad()
        do {
            try StarWarsSpeciesAPIClient.getStarWarsSpeciesInformation(page: self.pageNum, completion: { (starSpecies) in
                OperationQueue.main.addOperation {
                    self.starWarsSpeciesArr.append(contentsOf: starSpecies)
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
        return self.starWarsSpeciesArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "speciesCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.starWarsSpeciesArr[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.starWarsSpeciesArr.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.pageNum = self.pageNum + 1
        do {
            try StarWarsSpeciesAPIClient.getStarWarsSpeciesInformation(page: self.pageNum, completion: { (starSpecies) in
                OperationQueue.main.addOperation {
                    self.starWarsSpeciesArr.append(contentsOf: starSpecies)
                    self.tableView.reloadData()
                }
            })
        } catch let error{
            print("error is: \(error.localizedDescription)")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "speciesSegue"{
            if let destinationVC = segue.destination as? StarWarsSpecieDetailViewController{
                let neededIndexPath = self.tableView.indexPathForSelectedRow
                destinationVC.specieObject = self.starWarsSpeciesArr[(neededIndexPath?.row)!]
            }
        }
    }
}

