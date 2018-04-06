//
//  StarWarsFilms.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class MainStarWarsFilmsJson: Decodable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [StarWarsFilm]
}

struct StarWarsFilm: Decodable {
    var title: String?
    var episode_id: Int?
    var opening_crawl: String?
}

