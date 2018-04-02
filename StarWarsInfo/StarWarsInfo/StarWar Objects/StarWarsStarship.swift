//
//  StarWarsStarship.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MainStarWarsStarshipJson: Decodable{
    
    var count: Int
    var next: String?
    var previous: String?
    var results: [StarWarsStarship]
    
}

struct StarWarsStarship: Decodable{

    var name: String?
    var model: String?
    var manufacturer: String?
    var costInCredits: String?
    var length: String?
    var maxAtmosphericSpeed: String?
    var crew: String?
    var cargoCapacity: String?
    var starshipClass: String?
}
//
//    init(jsonDictionary: [String: Any]) {
//        guard
//            let name = jsonDictionary["name"] as? String,
//            let model = jsonDictionary["model"] as? String,
//            let manufacturer = jsonDictionary["manufacturer"] as? String,
//            let costInCredits = jsonDictionary["cost_in_credits"] as? String,
//            let length = jsonDictionary["length"] as? String,
//            let maxAtmosphericSpeed = jsonDictionary["max_atmosphering_speed"] as? String,
//            let crew = jsonDictionary["crew"] as? String,
//            let cargoCapacity = jsonDictionary["cargo_capacity"] as? String,
//            let starShipClass = jsonDictionary["starship_class"] as? String
//
//            else {print("did not unwrap"); return}
//
//        self.name = name
//        self.model = model
//        self.manufacturer = manufacturer
//        self.costInCredits = costInCredits
//        self.length = length
//        self.maxAtmosphericSpeed = maxAtmosphericSpeed
//        self.crew = crew
//        self.cargoCapacity = cargoCapacity
//        self.starshipClass = starShipClass
//    }
//
//}
