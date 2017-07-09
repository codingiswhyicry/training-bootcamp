//
//  final_score.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class final_score: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.integer(forKey: "points")
        defaults.integer(forKey: "ranking")
        
    }
    var defaults = UserDefaults.standard
    
    var level: Int = 0
    
    @IBOutlet weak var backing: UIView!
    @IBOutlet weak var pointsLabel: UILabel!
    
    @IBOutlet weak var backing2: UIView!
    @IBOutlet weak var rankingHeader: UILabel!
    @IBOutlet weak var currentRanking: UILabel!
    
    @IBOutlet weak var backing3: UIView!
    @IBOutlet weak var pointsHeader: UILabel!
    @IBOutlet weak var rankingLabel: UILabel!
    
    @IBOutlet weak var returnButton: UIButton!
    
}
