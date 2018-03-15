//
//  StarWarsSpeciesAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsSpeciesAPIClient {
    
    class func getStarWarsSpeciesInformation (page: Int, completion: @escaping(Array<Any>)-> ()){
        
        var jsonArray = Array<Any>()
        
        let url = "https://swapi.co/api/species/?page=\(page)"
        
        let convertedUrl = URL(string: url)
        
        guard let unwrappedConvertedUrl = convertedUrl else {print("unwrappedConvertedUrl did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else{print("unwrappedData did not unwrap"); return}
            
            let jsonDictionary = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
            
            guard let unwrappedJsonDictionary = jsonDictionary else {print("unwrappedJsonDictionary did not unwrap"); return}
            
            let resultsArray = unwrappedJsonDictionary["results"] as? Array<Any>
            
            guard let unwrappedResultsArray = resultsArray else {print("unwrappedResultsArray did not unwrap"); return}
            
            jsonArray = unwrappedResultsArray
            
            completion(jsonArray)
        }
        task.resume()
    }
}
