//
//  StarWarsSpecieDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsSpecieDetailViewController: UIViewController {
    
    var specieObject: StarWarsSpecies?
    @IBOutlet weak var nameUpdateLabel: UILabel!
    @IBOutlet weak var classificationUpdateLabel: UILabel!
    @IBOutlet weak var designationUpdateLabel: UILabel!
    @IBOutlet weak var heightUpdateLabel: UILabel!
    @IBOutlet weak var skinColorUpdateLabel: UILabel!
    @IBOutlet weak var hairColorUpateLabel: UILabel!
    @IBOutlet weak var eyeColorUpdateLabel: UILabel!
    @IBOutlet weak var lifespanUpdateLabel: UILabel!
    @IBOutlet weak var languageUpdateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let specieObj = self.specieObject else{print("did not update species object"); return}
        
        if let name = specieObj.name{
            self.nameUpdateLabel.text = name
        }
        if let classification = specieObj.classification{
            self.classificationUpdateLabel.text = classification
        }
        if let designation = specieObj.designation{
            self.designationUpdateLabel.text = designation
        }
        if let height = specieObj.average_height{
            self.heightUpdateLabel.text = height
        }
        
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
