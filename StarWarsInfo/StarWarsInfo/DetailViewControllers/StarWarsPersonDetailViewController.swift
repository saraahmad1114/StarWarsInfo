//
//  StarWarsPersonDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsPersonDetailViewController: UIViewController {
    
    var starWarsPeopleObject: StarWarsPeople?
    
    @IBOutlet weak var nameUpdateLabel: UILabel!
    @IBOutlet weak var heightUpdateLabel: UILabel!
    @IBOutlet weak var weightUpdateLabel: UILabel!
    @IBOutlet weak var hairColorUpdateLabel: UILabel!
    @IBOutlet weak var skinColorUpdateLabel: UILabel!
    @IBOutlet weak var eyeColorUpdateLabel: UILabel!
    @IBOutlet weak var birthYearUpdateLabel: UILabel!
    @IBOutlet weak var genderUpdateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let starwarsObject = self.starWarsPeopleObject else {print("did not unwrap the first star wars object"); return}
        
        if let name = starwarsObject.name {
           self.nameUpdateLabel.text = name
        }
        
        if let height = starwarsObject.height{
           self.heightUpdateLabel.text = height
        }
        
        if let weight = starwarsObject.weight{
           self.weightUpdateLabel.text = weight
        }
        
        if let hairColor = starwarsObject.hair_color{
           self.hairColorUpdateLabel.text = hairColor
        }
        
        if let skinColor = starwarsObject.skin_color{
           self.skinColorUpdateLabel.text = skinColor
        }
        
        if let eyeColor = starwarsObject.eye_color{
           self.eyeColorUpdateLabel.text = eyeColor
        }
        
        if let birthYear = starwarsObject.birth_year{
            self.birthYearUpdateLabel.text = birthYear
        }
        
        if let gender = starwarsObject.gender{
            self.genderUpdateLabel.text = gender
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
