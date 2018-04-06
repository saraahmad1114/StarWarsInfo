//
//  StarWarsVehicleDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsVehicleDetailViewController: UIViewController {
    
    var vehicleObj: StarWarsVehicle?
    
    @IBOutlet weak var nameUpdateLabel: UILabel!
    @IBOutlet weak var modelUpdateLabel: UILabel!
    @IBOutlet weak var manufacturerUpdateLabel: UILabel!
    @IBOutlet weak var costUpdateLabel: UILabel!
    @IBOutlet weak var maxSpeedUpdate: UILabel!
    @IBOutlet weak var crewUpdateLabel: UILabel!
    @IBOutlet weak var vehicleClassUpdateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
