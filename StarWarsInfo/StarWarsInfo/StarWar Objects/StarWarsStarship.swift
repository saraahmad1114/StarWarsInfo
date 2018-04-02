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

