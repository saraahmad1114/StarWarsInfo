//
//  StarWarsNetworkCall.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/25/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsNetworkCall{
    
    struct People: Decodable {
        var name: String?
        var height: String?
        var weight: String?
        var hairColor: String?
        var skinColor: String?
        var eyeColor: String?
        var birthYear: String?
        var gender: String?
    }
    
    struct Planets: Decodable {
        var name: String?
        var rotationPeriod: String?
        var orbitalPeriod: String?
        var diameter: String?
        var gravity: String?
        var terrain: String?
        var population: String?
    }
    
    struct Species: Decodable {
        var name: String?
        var classification: String?
        var designation: String?
        var averageHeight: String?
        var skinColor: String?
        var hairColor: String?
        var eyeColor: String?
        var lifespan: String?
        var language: String?
    }
    
    struct Starships: Decodable {
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
    
    struct Vehicle: Decodable {
        var name: String?
        var model: String?
        var manufacturer: String?
        var costInCredits: String?
        var maxAtmosphericSpeed: String?
        var crewCapacity: String?
        var vehicleClass: String
    }
    
    
    enum urlKeyWords {
        case people
        case planets
        case species
        case starships
        case vehicles
    }
    
    func getStarWarsInformationFrom ()
    
    
    
}
