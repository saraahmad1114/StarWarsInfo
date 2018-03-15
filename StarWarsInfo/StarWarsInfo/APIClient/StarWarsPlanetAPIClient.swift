//
//  StarWarsPlanetAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsPlanetsAPIClient{
    
    class func getStarWarsPlanetsInformation (page: Int, completion:@escaping(Array<Any>) -> ()){
        
        var starWarsPlanetsArray = Array<Any>()
        
        let starWarsPlanetsURL = "https://swapi.co/api/planets/?page=\(page)"
        
        let convertedURL = URL(string: starWarsPlanetsURL)
        
        guard let unwrappedConvertedURL = convertedURL else{print("unwrappedConvertedURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else {print("unwrappedData did not unwrap"); return}
            
            let jsonResponseDictionary = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
            
            guard let unwrappedJson = jsonResponseDictionary else{print("unwrappedJson did not unwrap"); return}
            
            let resultsArray = unwrappedJson["results"] as? Array<Any>
            
            guard let unwrappedResultsArray = resultsArray else{print("unwrappedResultsarray did not unwrap"); return}
            
            starWarsPlanetsArray = unwrappedResultsArray
            
            completion(starWarsPlanetsArray)
            
        }
        
        task.resume()
    }
    
}
