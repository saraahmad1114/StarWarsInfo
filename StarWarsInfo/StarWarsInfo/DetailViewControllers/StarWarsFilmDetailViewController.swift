//
//  StarWarsFilmDetailViewController.swift
//  StarWarsInfo
//
//  Created by Sara Ahmad on 3/15/18.
//  Copyright © 2018 Sara Ahmad. All rights reserved.
//

import UIKit

class StarWarsFilmDetailViewController: UIViewController {
    
    //Create a scrollview for the film synopsis
    //Constraint all the labels
    //Fix the last of the images from the background
    
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

}
