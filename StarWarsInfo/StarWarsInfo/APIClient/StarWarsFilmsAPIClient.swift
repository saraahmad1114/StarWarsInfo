//
//  StarWarsFilmsAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsFilmsAPIClient{
    
    class func getStarWarsFilmsInformation (completion:@escaping([StarWarsFilm]) -> ()) throws {
                
        let filmsUrl = "https://swapi.co/api/films"
        
        let convertedUrl = URL(string: filmsUrl)
        
        guard let unwrappedConvertedUrl = convertedUrl else {print("convertedUrl did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else {print("data did not unwrap"); return}
            
            do{
                
                let starWarsFilmsDataArray = try JSONDecoder().decode(MainStarWarsFilmsJson.self, from: unwrappedData)
                
                let resultsArray = starWarsFilmsDataArray.results
                
                completion(resultsArray)
            }
                
            catch let error {
                
                print("Error occured here: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
