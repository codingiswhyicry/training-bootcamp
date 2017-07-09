//
//  userProfile.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class userProfile: UIViewController {
    
    func createGradientLayer(view: UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [UIColor.clear.cgColor,  UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.5).cgColor]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    //initial launch screen + scan in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     self.view.backgroundColor = UIColor.clear
        
     backing.layer.cornerRadius = 3
     backing.clipsToBounds = true
     createGradientLayer(view: backing)
        
     backing2.layer.cornerRadius = 3
     backing2.clipsToBounds = true
     createGradientLayer(view: backing2)
        
     backing3.layer.cornerRadius = 3
     backing3.clipsToBounds = true
     createGradientLayer(view: backing3)
        
    }
    
    @IBOutlet weak var backButton: UIButton!
    
    var gradientLayer: CAGradientLayer!

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
