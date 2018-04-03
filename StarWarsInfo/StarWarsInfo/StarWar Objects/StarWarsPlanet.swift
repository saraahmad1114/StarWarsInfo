//
//  StarWarsPlanet.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MainStarWarsPlanetJson: Decodable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [StarWarsPlanet]
}

struct StarWarsPlanet: Decodable {
    var name: String?
    var rotation_period: String?
    var orbital_period: String?
    var diameter: String?
    var gravity: String?
    var terrain: String?
    var population: String?
}

