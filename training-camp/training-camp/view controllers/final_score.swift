//
//  final_score.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class final_score: UIViewController {

    func calculate_stats() {
        print("calculating stats")
        
        var points: Int = defaults.integer(forKey: "points")
        var user_level: Int = defaults.integer(forKey: "level")
        var ranking: String = defaults.string(forKey: "ranking")!
        switch points {
        case 0...10:
            ranking = "Level 0"
            level = 0
            break
        case 11...50:
            ranking = "Level 1"
            level = 1
            break
        case 51...100:
            ranking = "Level 2"
            level = 2
            break
        case 101...150:
            ranking = "Level 3"
            level = 3
            break
        case 151...200:
            ranking = "Level 4"
            level = 4
            break
        case 201...250:
            ranking = "Level 5"
            level = 5
            break
        case 251...300:
            ranking = "Level 6"
            level = 6
            break
        case 301...500:
            ranking = "Level 7"
            level = 7
            break
        case 501...700:
            ranking = "Level 8"
            level = 8
            break
        case 701...1000:
            ranking = "Level 9"
            level = 9
            break
        case 1001...10000:
            ranking = "Level 10"
            level = 10
            break
            
        default:
            ranking = "Level 0"
            level = 0
            break
        }
        
        defaults.set(ranking, forKey: "ranking")
        currentRanking.text = ranking
        
        switch level {
        case 1:
            pointsLabel.text = "10 point"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.integer(forKey: "points")
        defaults.string(forKey: "ranking")
        defaults.integer(forKey: "level")
        save_points()
        calculate_stats()
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
