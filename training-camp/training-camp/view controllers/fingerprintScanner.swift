//
//  fingerprintScanner.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/9/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class fingerprintScanner: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanner.backgroundColor = UIColor.clear
        scanner.layer.borderWidth = 3
        scanner.layer.cornerRadius = 3
        scanner.layer.borderColor = UIColor(red:0.46, green:0.69, blue:0.83, alpha:1.0).cgColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        fingerprint.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        
        fingerprint.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        
        print("tapped and stuff")
        
        UIView.animateKeyframes(withDuration: 1.2, delay: 0.0, options: UIViewKeyframeAnimationOptions.autoreverse, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4, animations: {
                
                self.scanner.backgroundColor = UIColor.clear
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.4, animations: {
                //blue
                self.scanner.backgroundColor = UIColor(red:0.46, green:0.69, blue:0.83, alpha:1.0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.4, animations: {
                //clear
                self.scanner.backgroundColor = UIColor.clear
            })
            
            }, completion: {finished in
                
                self.performSegue(withIdentifier: "toFingerScanner", sender: self)
                print("finishedr")
        })
    }
    @IBOutlet weak var scanner: UIView!
    @IBOutlet weak var fingerprint: UIImageView!
    
}
