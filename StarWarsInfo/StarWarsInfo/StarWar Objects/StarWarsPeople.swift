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

}
