//
//  mainMission.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import ARKit

class mainMission: UIViewController, SCNSceneRendererDelegate, ARSessionDelegate, ARSCNViewDelegate {
    
    func createGradientLayer(view: UIView) {
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red:0.00, green:0.48, blue:1.00, alpha:0.7).cgColor]
        
        view.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        train.alpha = 0.0
        profile.alpha = 0.0
        clock.alpha = 0.0
        
        backing.alpha = 0.0
        backing3.alpha = 0.0
        backing4.alpha = 0.0
        
        let configuration = ARSessionConfiguration()
        // Create an AR Session
        let arSession = ARSession()
        
        // Nominate self for session delegation
        arSession.delegate = self
        
        // Run the session
        arSession.run(configuration)
        
        sceneView.delegate = self
        
        self.view.backgroundColor = UIColor.clear
        
        let backgroundImage = UIImageView(frame: backing.bounds)
        backgroundImage.image = UIImage(named: "hexagons")
        backgroundImage.alpha = 0.5
        backing.insertSubview(backgroundImage, at: 0)
        
        let backgroundImage2 = UIImageView(frame: backing3.bounds)
        backgroundImage2.image = UIImage(named: "hexagons")
        backgroundImage2.alpha = 0.5
        backing3.insertSubview(backgroundImage2, at: 0)
        
        let backgroundImage3 = UIImageView(frame: backing4.bounds)
        backgroundImage3.image = UIImage(named: "hexagons")
        backgroundImage3.alpha = 0.5
        backing4.insertSubview(backgroundImage3, at: 0)
        
        //train.backgroundColor = UIColor.clear
        createGradientLayer(view: backing)
        //profile.backgroundColor = UIColor.clear
        clock.backgroundColor = UIColor.clear
        createGradientLayer(view: backing3)
        createGradientLayer(view: backing4)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.backing.alpha = 1.0
            self.profile.alpha = 1.0
            
        }, completion: {finished in
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.backing4.alpha = 1.0
                self.train.alpha = 1.0
                
            }, completion: {finished in
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.backing3.alpha = 1.0
                    self.clock.alpha = 1.0
                    
                })
                
            })
            
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.view.alpha = 0.0
            
        })
    }
    
    @objc func tick() {
        clock.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .long)
    }
    
    
    var gradientLayer: CAGradientLayer!
    
    @IBAction func trainAction(_ sender: Any) {
        
        print("time to train!")
        
        let missionP: Int = Int(arc4random_uniform(4))
        
        let missionLeader = missions[missionP]
        
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
    
    var missions: Array<String> = ["Aquaman", "Cyborg", "Superman", "Wonderwoman"]
    
    var missionLeader: String = ""
    
    var timer = Timer()
    
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var train: UIButton!
    @IBOutlet weak var profile: UIButton!
    @IBOutlet weak var clock: UILabel!
    
    @IBOutlet weak var backing: UIView!
    @IBOutlet weak var backing3: UIView!
    @IBOutlet weak var backing4: UIView!
}

