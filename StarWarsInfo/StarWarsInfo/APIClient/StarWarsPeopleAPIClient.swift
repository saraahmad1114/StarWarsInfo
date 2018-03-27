//
//  StarWarsPeopleAPIClient.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/14/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import Foundation

class StarWarsPeopleAPIClient
{
    class func getStarWarsPeopleInformation (page: Int, completion:@escaping ([StarWarsPeople])-> ()) throws {
        
        let starWarsPeopleURL = "https://swapi.co/api/people/?page=\(page)"
        
        let convertedStarWarsPeopleURL = URL(string: starWarsPeopleURL)
        
        guard let unwrappedConvertedStarWarsPeopleURL = convertedStarWarsPeopleURL else { print("unwrappedConvertedStarWarsPeopleURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedStarWarsPeopleURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else { print("unwrappedData did not unwrap"); return}
            
            do {
                let starWarsPeopleDataArray = try JSONDecoder().decode(MainJson.self, from: unwrappedData)
                
                let resultsArray = starWarsPeopleDataArray.results
                
                print(resultsArray)
                
                completion(resultsArray)
            }
            catch let error {
                print("Error occured here: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}


