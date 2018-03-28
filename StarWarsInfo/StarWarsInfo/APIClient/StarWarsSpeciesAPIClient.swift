//
//  StarWarsSpeciesAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsSpeciesAPIClient {
    
    class func getStarWarsSpeciesInformation (page: Int, completion: @escaping([StarWarsSpecies])-> ()) throws {
                
        let url = "https://swapi.co/api/species/?page=\(page)"
        
        let convertedUrl = URL(string: url)
        
        guard let unwrappedConvertedUrl = convertedUrl else {print("unwrappedConvertedUrl did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else{print("unwrappedData did not unwrap"); return}
            
            do{
                
                let starWarsSpeciesDataArray = try JSONDecoder().decode(MainStarWarsSpeciesJson.self, from: unwrappedData)
                
                let resultsArray = starWarsSpeciesDataArray.results
                
                print("**************************")
                print(resultsArray)
                print("**************************")
                
                completion(resultsArray)
            }
                
            catch let error {
                
                print("Error occured here: \(error.localizedDescription)")
                
            }
        }
        task.resume()
    }
}
