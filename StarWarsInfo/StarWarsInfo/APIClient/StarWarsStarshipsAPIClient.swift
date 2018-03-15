//
//  StarWarsStarshipsAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsStarshipsAPIClient{
    
    class func getStarWarsStarshipsInformation (page: Int, completion: @escaping(Array<Any>)-> ()){
        
        var jsonStarWarsStarshipsArray = Array<Any>()
        
        let starWarsStarshipURL = "https://swapi.co/api/starships/?page=\(page)"
        
        let convertedURL = URL(string: starWarsStarshipURL)
        
        guard let unwrappedConvertedURL = convertedURL else {print("unwrappedConvertedURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else{print("unwrappedData did not unwrap"); return}
            
            let jsonDictionary = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
            
            guard let unwrappedJsonDictionary = jsonDictionary else {print("unwrappedJsonDictionary did not unwrap"); return}
            
            let resultsArray = unwrappedJsonDictionary["results"] as? Array<Any>
            
            guard let unwrappedResultsArray = resultsArray else {print("unwrappedResultsArray did not unwrap"); return}
            
            jsonStarWarsStarshipsArray = unwrappedResultsArray
            
            completion(jsonStarWarsStarshipsArray)
        }
        task.resume()
        
    }
    
}
