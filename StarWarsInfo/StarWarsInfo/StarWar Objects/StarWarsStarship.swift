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
    var cost_in_credits: String?
    var length: String?
    var max_atmosphering_speed: String?
    var crew: String?
    var cargo_capacity: String?
    var starship_class: String?
}

