//
//  StarWarsFilmDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsFilmDetailViewController: UIViewController {
    
    var filmObj: StarWarsFilm?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeNumLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let filmObject = self.filmObj else{print("did not unwrap filmObject"); return}
        
        if let title = filmObject.title{
            self.titleLabel.text = title
        }
        if let episodeNum = filmObject.episode_id{
            self.episodeNumLabel.text = String(episodeNum)
        }
        if let synopsis = filmObject.opening_crawl{
            self.synopsisLabel.text = synopsis
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
