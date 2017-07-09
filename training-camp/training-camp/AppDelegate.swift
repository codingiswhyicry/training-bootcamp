//
//  AppDelegate.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
         let window = self.window!
        
        let backgroundView = UIImageView(frame: window.frame)
        
        backgroundView.image = UIImage(named: "trainingCamp")
        
        window.addSubview(backgroundView)
        
        window.backgroundColor = UIColor.clear
        // Override point for customization after application launch.
        return true
    }

}

