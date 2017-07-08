//
//  ViewController.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func flash(m_view: UIView) {
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            m_view.alpha = 0.0
            
        }, completion: {finished in
            
            self.performSegue(withIdentifier: "toMainMission", sender: self)
        })
        
    }
    
    
    @objc func handleTap() {
        
        print("tapped!")
        flash(m_view: imageView)
    }
    
//initial launch screen + scan in 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        imageView.addGestureRecognizer(tap)
        
        imageView.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        
        self.view.backgroundColor = UIColor.clear
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
}

