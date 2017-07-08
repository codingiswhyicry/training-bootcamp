//
//  userProfile.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class userProfile: UIViewController {
    
    
    //initial launch screen + scan in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     self.view.backgroundColor = UIColor.clear
        
        
     backing.layer.cornerRadius = 3
     backing.clipsToBounds = true
        
     backing2.layer.cornerRadius = 3
     backing2.clipsToBounds = true
        
     backing3.layer.cornerRadius = 3
     backing3.clipsToBounds = true
    }

    @IBOutlet weak var rankingHeader: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    
    @IBOutlet weak var nameHeader: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var achievementHeader: UILabel!
    @IBOutlet weak var achievementLabel: UILabel!
    
    @IBOutlet weak var backing: UIView!
    @IBOutlet weak var backing2: UIView!
    @IBOutlet weak var backing3: UIView!
    
}
