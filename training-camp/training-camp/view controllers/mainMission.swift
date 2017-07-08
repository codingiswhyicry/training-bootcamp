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
    
    func createGradientLayer(view: UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [UIColor.clear.cgColor,  UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.5).cgColor]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        
        train.backgroundColor = UIColor.clear
        createGradientLayer(view: backing)
        profile.backgroundColor = UIColor.clear
        createGradientLayer(view: backing2)
        clock.backgroundColor = UIColor.clear
        createGradientLayer(view: backing3)
        date.backgroundColor = UIColor.clear
        createGradientLayer(view: backing4)
        
    }

    
    var gradientLayer: CAGradientLayer!
    
    @IBOutlet weak var train: UIButton!
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var backing: UIView!
    @IBOutlet weak var backing2: UIView!
    @IBOutlet weak var backing3: UIView!
    @IBOutlet weak var backing4: UIView!
    
}
