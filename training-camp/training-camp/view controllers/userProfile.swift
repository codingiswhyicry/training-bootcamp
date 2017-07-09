//
//  userProfile.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import ARKit

class userProfile: UIViewController, SCNSceneRendererDelegate, ARSessionDelegate, ARSCNViewDelegate {
    
    func createGradientLayer(view: UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red:0.00, green:0.48, blue:1.00, alpha:0.5).cgColor]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    //initial launch screen + scan in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backing.alpha = 0.0
        backing2.alpha = 0.0
        backing3.alpha = 0.0
        
        rankingHeader.alpha = 0.0
        nameHeader.alpha = 0.0
        achievementHeader.alpha = 0.0
        
        rankingLabel.alpha = 0.0
        nameLabel.alpha = 0.0
        achievementLabel.alpha = 0.0
        
        var points: Int = defaults.integer(forKey: "points")
        var user_level: Int = defaults.integer(forKey: "level")
        var rank: String = defaults.string(forKey: "ranking")!
        
        nameLabel.text = "\(points)\n Points"
        
        rankingLabel.text = rank
        
        let configuration = ARSessionConfiguration()
        // Create an AR Session
        let arSession = ARSession()
        
        // Nominate self for session delegation
        arSession.delegate = self
        
        // Run the session
        arSession.run(configuration)
        
        sceneView.delegate = self
        
        self.view.backgroundColor = UIColor.white
        
        let backgroundImage = UIImageView(frame: backing.bounds)
        backgroundImage.image = UIImage(named: "hexagons")
        backgroundImage.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.3)
        backing.insertSubview(backgroundImage, at: 0)
        
        let backgroundImage2 = UIImageView(frame: backing2.bounds)
        backgroundImage2.image = UIImage(named: "hexagons")
        backgroundImage2.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.3)
        backing2.insertSubview(backgroundImage2, at: 0)
        
        let backgroundImage3 = UIImageView(frame: backing3.bounds)
        backgroundImage3.image = UIImage(named: "hexagons")
        backgroundImage3.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.3)
        backing3.insertSubview(backgroundImage3, at: 0)
        
        backing.layer.cornerRadius = 3
        backing.clipsToBounds = true
        backing.backgroundColor = UIColor.clear
        createGradientLayer(view: backing)
        
        backing2.layer.cornerRadius = 3
        backing2.clipsToBounds = true
        backing2.backgroundColor = UIColor.clear
        createGradientLayer(view: backing2)
        
        backing3.layer.cornerRadius = 3
        backing3.clipsToBounds = true
        backing3.backgroundColor = UIColor.clear
        createGradientLayer(view: backing3)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.backing.alpha = 1.0
            self.backing2.alpha = 1.0
            self.backing3.alpha = 1.0
            
            }, completion: {finished in
            
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.achievementHeader.alpha = 1.0
                    self.rankingHeader.alpha = 1.0
                    self.nameHeader.alpha = 1.0
                    
                }, completion: {finished in
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        self.achievementLabel.alpha = 1.0
                        self.rankingLabel.alpha = 1.0
                        self.nameLabel.alpha = 1.0
                })
            })
        })
    }
    
    var defaults = UserDefaults.standard
    
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
    
    @IBOutlet weak var sceneView: ARSCNView!
    
}


