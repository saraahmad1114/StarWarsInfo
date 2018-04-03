//
//  StarWarsStarshipsAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsStarshipsAPIClient{
    
    class func getStarWarsStarshipsInformation (page: Int, completion: @escaping([StarWarsStarship])-> ()) throws {
        
        let starWarsStarshipURL = "https://swapi.co/api/starships/?page=\(page)"
        
        let convertedURL = URL(string: starWarsStarshipURL)
        
        guard let unwrappedConvertedURL = convertedURL else {print("unwrappedConvertedURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else{print("unwrappedData did not unwrap"); return}
            
            do{
                
                let starWarsStarshipDataArray = try JSONDecoder().decode(MainStarWarsStarshipJson.self, from: unwrappedData)
                
                let resultsArray = starWarsStarshipDataArray.results
                
                completion(resultsArray)
            }
                
            catch let error {
                
                print("Error occured here: \(error.localizedDescription)")
                
            }
        }
        task.resume()
    }
}
