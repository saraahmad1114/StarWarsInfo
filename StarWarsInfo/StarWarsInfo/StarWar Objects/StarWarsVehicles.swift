//
//  StarWarsVehicles.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsVehicles{
    
    var name: String?
    var model: String?
    var manufacturer: String?
    var costInCredits: String?
    var maxAtmosphericSpeed: String?
    var crewCapacity: String?
    var vehicleClass: String?
    
    init(jsonDictionary: [String: Any]) {
        guard
            let name = jsonDictionary["name"] as? String,
            let model = jsonDictionary["model"] as? String,
            let manufacturer = jsonDictionary["manufacturer"] as? String,
            let costInCredits = jsonDictionary["cost_in_credits"] as? String,
            let maxAtmosphericSpeed = jsonDictionary["max_atmosphering_speed"] as? String,
            let crewCapacity = jsonDictionary["crew"] as? String,
            let vehicleClass = jsonDictionary["vehicle_class"] as? String
            else {print("did not unwrap"); return}
        
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.costInCredits = costInCredits
        self.maxAtmosphericSpeed = maxAtmosphericSpeed
        self.crewCapacity = crewCapacity
        self.vehicleClass = vehicleClass
        
    }
}
