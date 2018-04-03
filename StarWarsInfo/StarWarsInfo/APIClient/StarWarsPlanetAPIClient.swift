//
//  StarWarsPlanetAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsPlanetsAPIClient{
    
    class func getStarWarsPlanetsInformation (page: Int, completion:@escaping([StarWarsPlanet]) -> ()) throws {
                
        let starWarsPlanetsURL = "https://swapi.co/api/planets/?page=\(page)"
        
        let convertedURL = URL(string: starWarsPlanetsURL)
        
        guard let unwrappedConvertedURL = convertedURL else{print("unwrappedConvertedURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else {print("unwrappedData did not unwrap"); return}
            
            do{
                
                let starWarsPlanetsDataArray = try JSONDecoder().decode(MainStarWarsPlanetJson.self, from: unwrappedData)
                
                let resultsArray = starWarsPlanetsDataArray.results
                
                completion(resultsArray)
            }
                
            catch let error {
                
                print("Error occured here: \(error.localizedDescription)")
                
            }
        }
        
        task.resume()
    }
}
