//
//  StarWarsStarshipDataStore.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsStarshipDataStore{
    
    static let sharedInstance = StarWarsStarshipDataStore()
    private init() {}
    
    var starWarsStarshipArray = [StarWarsStarship]()
    var page = 1
    
    func getStarWarsStarshipInformation (page: Int, completion:@escaping ([StarWarsStarship]) -> ()){
        StarWarsStarshipsAPIClient.getStarWarsStarshipsInformation(page: page) { (starWarsStarshipsJsonArray) in
            for singleDictionary in starWarsStarshipsJsonArray{
                
                guard let unwrappedSingleDictionary = singleDictionary as? [String: Any] else{print("singleDictionary did not unwrap"); return
                }
                let starShipObject = StarWarsStarship.init(jsonDictionary: unwrappedSingleDictionary)
                self.starWarsStarshipArray.append(starShipObject)
            }
            completion(self.starWarsStarshipArray)
        }
    }
    
    func retrieveNextPageInformation()
    {
        self.page += 1
    }
}
