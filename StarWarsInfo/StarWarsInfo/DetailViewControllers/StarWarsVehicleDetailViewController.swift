//
//  StarWarsVehicleDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsVehicleDetailViewController: UIViewController {
    
    var vehicleObj: StarWarsVehicle?
    
    @IBOutlet weak var nameUpdateLabel: UILabel!
    @IBOutlet weak var modelUpdateLabel: UILabel!
    @IBOutlet weak var manufacturerUpdateLabel: UILabel!
    @IBOutlet weak var costUpdateLabel: UILabel!
    @IBOutlet weak var maxSpeedUpdate: UILabel!
    @IBOutlet weak var crewUpdateLabel: UILabel!
    @IBOutlet weak var vehicleClassUpdateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let vehicleObject = self.vehicleObj else {print("did not unwrap vehicleObject"); return}
        
        if let name = vehicleObject.name {
            self.nameUpdateLabel.text = name
        }
        if let model = vehicleObject.model{
            self.modelUpdateLabel.text = model
        }
        if let manufacturer = vehicleObject.manufacturer{
            self.manufacturerUpdateLabel.text = manufacturer
        }
        if let cost = vehicleObject.cost_in_credits{
            self.costUpdateLabel.text = cost
        }
        if let speed = vehicleObject.max_atmosphering_speed{
            self.maxSpeedUpdate.text = speed
        }
        if let crew = vehicleObject.crew{
            self.crewUpdateLabel.text = crew
        }
        if let vehicleClass = vehicleObject.vehicle_class{
            self.vehicleClassUpdateLabel.text = vehicleClass
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
