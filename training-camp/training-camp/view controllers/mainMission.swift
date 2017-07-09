//
//  mainMission.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class mainMission: UIViewController {
    
    func disable_alert() {
        
        alertView.alpha = 0.0
        accept.isUserInteractionEnabled = false
        alertView.isUserInteractionEnabled = false
        alertView.isHidden = true
        
    }
    
    func enable_alert(leader: String) {
        
        var missionStatement: String
        
        switch leader {
        case "Aquaman":
            imageView.image = #imageLiteral(resourceName: "Aquaman")
            missionStatement = "Hey kid, we have a problem down at the water. Let's hit it, before this becomes too big of a problem."
            missionLeader = "Aquaman"
            break
            
        case "Cyborg":
            imageView.image = #imageLiteral(resourceName: "Cyborg")
            missionStatement = "Gotham needs someone well-versed in cybersecurity during times of crisis. I think you're just the person."
            missionLeader = "Cyborg"
            break
            
        case "Superman":
            imageView.image = #imageLiteral(resourceName: "Superman")
            missionStatement = "There's a conflict with a couple people. This is the perfect time to start your diffusion training."
            missionLeader = "Superman"
            break
            
        case "Wonderwoman":
            imageView.image = #imageLiteral(resourceName: "Wonderwoman")
            missionStatement = "A couple of pricks need some training in equality. Are you ready?"
            missionLeader = "Wonderwoman"
            break
            
        default:
            missionStatement = "sorry, something went wrong!"
            break
        }
        
        textMission.text = missionStatement
        
        alertView.alpha = 1.0
        accept.isUserInteractionEnabled = true
        alertView.isUserInteractionEnabled = true
        alertView.isHidden = false
        
    }
    
    func createGradientLayer(view: UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor,  UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.5).cgColor]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.clear
        
        disable_alert()
        
        train.backgroundColor = UIColor.clear
        createGradientLayer(view: backing)
        profile.backgroundColor = UIColor.clear
        createGradientLayer(view: backing2)
        clock.backgroundColor = UIColor.clear
        createGradientLayer(view: backing3)
        date.backgroundColor = UIColor.clear
        createGradientLayer(view: backing4)
        
        alertView.backgroundColor = UIColor.clear
        
    }
    
    var gradientLayer: CAGradientLayer!
    
    @IBAction func trainAction(_ sender: Any) {
        
        print("time to train!")
        
        let missionLeader: Int = Int(arc4random_uniform(4))
        
        switch missionLeader {
            
        case 0:
            enable_alert(leader: "Aquaman")
            break
            
        case 1:
            enable_alert(leader: "Cyborg")
            break
            
        case 2:
            enable_alert(leader: "Superman")
            break
            
        case 3:
            enable_alert(leader: "Wonderwoman")
            break
            
        default:
            break
        }
        
    }
    
    var missions: Array<String> = ["Aquaman", "Cyborg", "Superman", "Wonderwoman"]
    
    var missionLeader: String = ""
    
    @IBOutlet weak var train: UIButton!
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var backing: UIView!
    @IBOutlet weak var backing2: UIView!
    @IBOutlet weak var backing3: UIView!
    @IBOutlet weak var backing4: UIView!
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var messageBacking: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textMission: UITextView!
    @IBOutlet weak var accept: UIButton!
    @IBAction func acceptAction(_ sender: Any) {
        
        switch missionLeader {
            
        case "Aquaman":
            self.performSegue(withIdentifier: "toAquaman", sender: self)
            break
            
        case "Cyborg":
            self.performSegue(withIdentifier: "toCyborg", sender: self)
            break
            
        case "Superman":
            self.performSegue(withIdentifier: "toSuperman", sender: self)
            break
            
        case "Wonderwoman":
            self.performSegue(withIdentifier: "toWonderWoman", sender: self)
            break
            
        default :
            print("oh no")
            break
        }
    }
}
