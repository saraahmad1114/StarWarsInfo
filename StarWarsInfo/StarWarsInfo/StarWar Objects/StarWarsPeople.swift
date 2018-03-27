//
//  StarWarsPeople.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MainJson: Decodable{
    
    var count: Int
    var next: String?
    var previous: String?
    var results: [StarWarsPeople]
}


struct StarWarsPeople: Decodable {
    
    var name: String?
    var height: String?
    var weight: String?
    var hair_color: String?
    var skin_color: String?
    var eye_color: String?
    var birth_year: String?
    var gender: String?
    
//    init(jsonDictionary: [String: Any]) {
//        guard
//            let name =  jsonDictionary["name"] as? String,
//            let height = jsonDictionary["height"] as? String,
//            let weight = jsonDictionary["mass"] as? String,
//            let hair_color = jsonDictionary["hair_color"] as? String,
//            let skin_color = jsonDictionary["skin_color"] as? String,
//            let eye_color = jsonDictionary["eye_color"] as? String,
//            let birth_year = jsonDictionary["birth_year"] as? String,
//            let gender  = jsonDictionary["gender"] as? String
//            else {print("did not unwrap"); return}
//
//        self.name = name
//        self.height = height
//        self.weight = weight
//        self.hair_color = hair_color
//        self.skin_color = skin_color
//        self.eye_color = eye_color
//        self.birth_year = birth_year
//        self.gender = gender
//    }
}
