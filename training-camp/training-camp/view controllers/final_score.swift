//
//  final_score.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import ARKit

class final_score: UIViewController, SCNSceneRendererDelegate, ARSessionDelegate, ARSCNViewDelegate {
    
    func calculate_stats() {
        print("calculating stats")
        
        var points: Int = defaults.integer(forKey: "points")
        var user_level: Int = defaults.integer(forKey: "level")
        var ranking: String = ""
        
        switch points {
        case 0...10:
            ranking = "Level 0"
            user_level = 0
            break
        case 11...50:
            ranking = "Level 1"
            user_level = 1
            break
        case 51...100:
            ranking = "Level 2"
            user_level = 2
            break
        case 101...150:
            ranking = "Level 3"
            user_level = 3
            break
        case 151...200:
            ranking = "Level 4"
            user_level = 4
            break
        case 201...250:
            ranking = "Level 5"
            user_level = 5
            break
        case 251...300:
            ranking = "Level 6"
            user_level = 6
            break
        case 301...500:
            ranking = "Level 7"
            user_level = 7
            break
        case 501...700:
            ranking = "Level 8"
            user_level = 8
            break
        case 701...1000:
            ranking = "Level 9"
            user_level = 9
            break
        case 1001...10000:
            ranking = "Level 10"
            user_level = 10
            break
            
        default:
            ranking = "Level 0"
            user_level = 0
            break
        }
        
        defaults.set(ranking, forKey: "ranking")
        currentRanking.text = ranking
        
        rankingLabel.text = "\(points) points"
        
        switch user_level {
        case 1:
            pointsLabel.text = "10 points"
            break
        case 2:
            pointsLabel.text = "20 points"
            break
        case 3:
            points += 30
            pointsLabel.text = "30 points"
            break
        case 4:
            points += 40
            pointsLabel.text = "40 points"
            break
        case 5:
            points += 50
            pointsLabel.text = "50 points"
            break
            
        default:
            points += 0
            break
        }
    }
    
    func save_points() {
        print("save points")
        
        var points: Int = defaults.integer(forKey: "points")
        
        switch level {
        case 1:
            points += 10
            break
        case 2:
            points += 20
            break
        case 3:
            points += 30
            break
        case 4:
            points += 40
            break
        case 5:
            points += 50
            break
        default:
            points += 0
            break
        }
        
        defaults.set(points, forKey: "points")
        
    }
    
    func createGradientLayer(view: UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red:0.00, green:0.48, blue:1.00, alpha:0.5).cgColor]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    //initial launch screen + scan in
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let backgroundImage = UIImageView(frame: backing.bounds)
        backgroundImage.image = UIImage(named: "hexagons")
        backing.insertSubview(backgroundImage, at: 0)
        
        let backgroundImage2 = UIImageView(frame: backing2.bounds)
        backgroundImage2.image = UIImage(named: "hexagons")
        backing2.insertSubview(backgroundImage2, at: 0)
        
        let backgroundImage3 = UIImageView(frame: backing3.bounds)
        backgroundImage3.image = UIImage(named: "hexagons")
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
        
        save_points()
        calculate_stats()
    }
    
    var defaults = UserDefaults.standard
    var gradientLayer: CAGradientLayer!
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
    
    @IBOutlet weak var sceneKit: ARSCNView!
    
}


