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
    
    @IBOutlet weak var upateNameLabel: UILabel!
    @IBOutlet weak var updateRotationLabel: UILabel!
    @IBOutlet weak var updateOrbital: UILabel!
    @IBOutlet weak var updateDiameter: UILabel!
    @IBOutlet weak var updateGravity: UILabel!
    @IBOutlet weak var updatePopulation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //guard let starWarObject = self.starWarsPlanetObject else {print("did not unwrap the upper level objecct"); return}
        
        //if let name = starWarObject.name {
            //self.upateNameLabel.text = name
        //}
        //if let rotation = starWarObject.rotation_period{
            //self.updateRotationLabel.text = rotation
        //}
        //if let orbital = starWarObject.orbital_period{
            //self.updateOrbital.text = orbital
        //}
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
