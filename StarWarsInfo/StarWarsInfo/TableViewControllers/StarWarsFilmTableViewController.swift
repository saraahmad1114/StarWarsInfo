//
//  StarWarsFilmTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsFilmTableViewController: UITableViewController {

//    let store = StarWarsFilmsDataStore.sharedInstance
    //starvar pageNum = 1
    var starWarsFilmsArr = [StarWarsFilm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
        
        do {
            try StarWarsFilmsAPIClient.getStarWarsFilmsInformation(completion: { (starWarArray) in
                OperationQueue.main.addOperation {
                    self.starWarsFilmsArr.append(contentsOf: starWarArray)
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
        return self.starWarsFilmsArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.starWarsFilmsArr[indexPath.row].title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueFilm"{
            if let destinationVC = segue.destination as? StarWarsFilmDetailViewController{
                let neededIndexPath = self.tableView.indexPathForSelectedRow
                destinationVC.filmObj = self.starWarsFilmsArr[(neededIndexPath?.row)!]
            }
        }
    }
}
