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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
