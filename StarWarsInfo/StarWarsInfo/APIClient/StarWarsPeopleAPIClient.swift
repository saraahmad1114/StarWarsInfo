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
    
    class func getStarWarsPeopleInformation (page: Int, completion:@escaping (Array<Any>)-> ()){
        
        var starWarsPeopleArray = Array<Any>()
        
        let starWarsPeopleURL = "https://swapi.co/api/people/?page=\(page)"
        
        let convertedStarWarsPeopleURL = URL(string: starWarsPeopleURL)
        
        guard let unwrappedConvertedStarWarsPeopleURL = convertedStarWarsPeopleURL else {
            print("unwrappedConvertedStarWarsPeopleURL did not unwrap"); return}
        
        let request = URLRequest(url: unwrappedConvertedStarWarsPeopleURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //guard let unwrappedData = data else { print("unwrappedData did not unwrap"); return}

            
            do{
            
            if let data = data{
                
            let jsonResponseDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            guard let unwrappedJsonResponseDictionary = jsonResponseDictionary else {
                print("unwrappedJsonResponseDictionary did not unwrap"); return
            }
            
            let resultsArray = unwrappedJsonResponseDictionary["results"] as? Array<Any>
            
            guard let unwrappedResultsArray = resultsArray else{print("unwrappedResultsarray did not unwrap"); return}
            
            starWarsPeopleArray = unwrappedResultsArray
            
            completion(starWarsPeopleArray)
                }
            }
            
            catch let error{
                print(error)
            }
            
        }
        
        task.resume()
    }
    
}
