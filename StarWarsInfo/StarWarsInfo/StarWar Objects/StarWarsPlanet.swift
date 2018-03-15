//
//  StarWarsPlanet.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsPlanet{
    
    var name: String?
    var rotationPeriod: String?
    var orbitalPeriod: String?
    var diameter: String?
    var gravity: String?
    var terrain: String?
    var population: String?
    
    init(jsonDictionary: [String: Any]) {
        guard
            let name = jsonDictionary["name"] as? String,
            let rotationPeriod = jsonDictionary["rotation_period"] as? String,
            let orbitalPeriod = jsonDictionary["orbital_period"] as? String,
            let diameter = jsonDictionary["diameter"] as? String,
            let gravity = jsonDictionary["gravity"] as? String,
            let terrain = jsonDictionary["terrain"] as? String,
            let population = jsonDictionary["population"] as? String
            else { print("did not unwrap"); return }
        
        self.name = name
        self.rotationPeriod = rotationPeriod
        self.orbitalPeriod = orbitalPeriod
        self.diameter = diameter
        self.gravity = gravity
        self.terrain = terrain
        self.population = population
        
    }
}
