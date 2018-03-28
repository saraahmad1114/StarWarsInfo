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
    
//    init(jsonDictionary: [String: Any]) {
//        guard
//            let name = jsonDictionary["name"] as? String,
//            let classification = jsonDictionary["classification"] as? String,
//            let designation = jsonDictionary["designation"] as? String,
//            let averageHeight = jsonDictionary["average_height"] as? String,
//            let skinColor = jsonDictionary["skin_colors"] as? String,
//            let hairColor = jsonDictionary["hair_colors"] as? String,
//            let eyeColor = jsonDictionary["eye_colors"] as? String,
//            let lifespan = jsonDictionary["average_lifespan"] as? String,
//            let language = jsonDictionary["language"] as? String
//            else{print("did not unwrap"); return}
//
//        self.name = name
//        self.classification = classification
//        self.designation = designation
//        self.averageHeight = averageHeight
//        self.skinColor = skinColor
//        self.hairColor = hairColor
//        self.eyeColor = eyeColor
//        self.lifespan = lifespan
//        self.language = language
//    }
}
