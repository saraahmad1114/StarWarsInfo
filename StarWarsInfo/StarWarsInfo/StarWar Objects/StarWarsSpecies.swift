//
//  StarWarsSpecies.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MainStarWarsSpeciesJson: Decodable{
    var count: Int
    var next: String
    var previous: String
    var results: [StarWarsSpecies]
}

struct StarWarsSpecies: Decodable{
    
    var name: String?
    var classification: String?
    var designation: String?
    var average_height: String?
    var skin_colors: String?
    var hair_colors: String?
    var eye_colors: String?
    var average_lifespan: String?
    var language: String?
    
}
