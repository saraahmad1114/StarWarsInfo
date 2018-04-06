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

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let starShipObj = self.starShipObject else {print("did not unwrap starshipObject"); return}
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
