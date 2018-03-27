//
//  StarWarsPeople.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsPeople: Decodable {
    
    var name: String?
    var height: String?
    var weight: String?
    var hairColor: String?
    var skinColor: String?
    var eyeColor: String?
    var birthYear: String?
    var gender: String?
    
    init(jsonDictionary: [String: Any]) {
        guard
            let name =  jsonDictionary["name"] as? String,
            let height = jsonDictionary["height"] as? String,
            let weight = jsonDictionary["mass"] as? String,
            let hairColor = jsonDictionary["hair_color"] as? String,
            let skinColor = jsonDictionary["skin_color"] as? String,
            let eyeColor = jsonDictionary["eye_color"] as? String,
            let birthYear = jsonDictionary["birth_year"] as? String,
            let gender  = jsonDictionary["gender"] as? String
            else {print("did not unwrap"); return}
        
        self.name = name
        self.height = height
        self.weight = weight
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
    }
}
