//
//  mainMission.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class mainMission: UIViewController {
    
    //main screen
    
    func createGradientLayer() {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.clear().CGColor, UIColor.yellowColor().CGColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        
        train.backgroundColor = UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.3)
        profile.backgroundColor = UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.3)
        clock.backgroundColor = UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.3)
        date.backgroundColor = UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.3)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var train: UIButton!
    @IBOutlet weak var profile: UIButton!
    
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var date: UILabel!
    
}
