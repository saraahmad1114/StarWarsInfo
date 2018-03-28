//
//  StarWarsPeopleTableViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsPeopleTableViewController: UITableViewController {
    
    var pageNum = 1
    var starWarsPeopleArray = [StarWarsPeople]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
        do {
            try StarWarsPeopleAPIClient.getStarWarsPeopleInformation(page: self.pageNum, completion: { (starWarsPArray) in
                OperationQueue.main.addOperation {
                    self.starWarsPeopleArray.append(contentsOf: starWarsPArray)
                    print(self.starWarsPeopleArray)
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
        return self.starWarsPeopleArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = self.starWarsPeopleArray[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = self.starWarsPeopleArray.count-1
        if indexPath.row == lastElement{
            loadMoreData()
        }
    }
    
    func loadMoreData(){
        self.pageNum = pageNum + 1
        do {
            try StarWarsPeopleAPIClient.getStarWarsPeopleInformation(page: self.pageNum, completion: { (starWarsPArray) in
                OperationQueue.main.addOperation {
                    self.starWarsPeopleArray.append(contentsOf: starWarsPArray)
                    self.tableView.reloadData()
                }
            })
        } catch let error{
            print("error is: \(error.localizedDescription)")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "peopleDetailSegue"{
            if let destinationVC = segue.destination as? StarWarsPersonDetailViewController {
                let neededIndexPath = self.tableView.indexPathForSelectedRow!
                destinationVC.starWarsPeopleObject = self.starWarsPeopleArray[neededIndexPath.row]
            }
        }
    }
}
