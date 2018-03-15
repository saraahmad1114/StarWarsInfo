//
//  StarWarsFilmsAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsFilmsAPIClient{
    
    class func getStarWarsFilmsInformation (completion:@escaping(Array<Any>) -> ()){
        
        var filmsJSonArray = Array<Any>()
        
        let filmsUrl = "https://swapi.co/api/films"
        
        let convertedUrl = URL(string: filmsUrl)
        
        guard let unwrappedConvertedUrl = convertedUrl else {print("convertedUrl did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else {print("data did not unwrap"); return}
            
            let jsonDictionary = try? JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
            
            guard let uwnrappedJsonDictionary = jsonDictionary else {print("jsonDictionary did not unwrap"); return}
            
            let resultsArray = uwnrappedJsonDictionary["results"] as? Array<Any>
            
            guard let unwrappedResultsArray = resultsArray else {print("resultsArray did not unwrap"); return}
            
            filmsJSonArray =  unwrappedResultsArray
            
            completion(filmsJSonArray)
        }
        task.resume()
    }
    
}
