//
//  StarWarsStarshipDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsStarshipDetailViewController: UIViewController {
    
    var starShipObject: StarWarsStarship?
    
    @IBOutlet weak var nameUpdateLabel: UILabel!
    @IBOutlet weak var modelUpdateLabel: UILabel!
    @IBOutlet weak var manufacturerUpdateLabel: UILabel!
    @IBOutlet weak var costUpdateLabel: UILabel!
    @IBOutlet weak var lengthUpdateLabel: UILabel!
    @IBOutlet weak var speedUpdateLabel: UILabel!
    @IBOutlet weak var crewUpdateLabel: UILabel!
    @IBOutlet weak var cargoUpdateLabel: UILabel!
    @IBOutlet weak var starShipUpdateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let starShipObj = self.starShipObject else {print("did not unwrap starshipObject"); return}
        
        if let name = starShipObj.name{
            self.nameUpdateLabel.text = name 
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
