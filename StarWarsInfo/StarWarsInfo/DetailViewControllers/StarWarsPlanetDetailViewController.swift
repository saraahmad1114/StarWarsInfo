//
//  StarWarsPlanetDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsPlanetDetailViewController: UIViewController {
    
    var starWarsPlanetObject: StarWarsPlanet?
    
    @IBOutlet weak var nameUpdateLabel: UILabel!
    @IBOutlet weak var rotationUpdateLabel: UILabel!
    @IBOutlet weak var orbitalPeriodUpdateLabel: UILabel!
    @IBOutlet weak var diameterUpdateLabel: UILabel!
    @IBOutlet weak var gravityUpdateLabel: UILabel!
    @IBOutlet weak var populationUpdatelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let starWarObject = self.starWarsPlanetObject else {print("did not unwrap the upper level objecct"); return}
        
        if let name = starWarObject.name {
            self.nameUpdateLabel.text = name
        }
        
        if let rotation = starWarObject.rotation_period{
            self.rotationUpdateLabel.text = rotation
        }
        
        if let orbital = starWarObject.orbital_period{
            self.orbitalPeriodUpdateLabel.text = orbital
        }
        
        //if let diameter = starWarObject.diameter{
            //self.updateDiameter.text = diameter
        //}
        //if let gravity = starWarObject.gravity{
            //self.updateGravity.text = gravity
        //}
        //if let population = starWarObject.population{
            //self.updatePopulation.text = population
        //}

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
