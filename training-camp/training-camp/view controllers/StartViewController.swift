//
//  StartViewController.swift
//  training-camp
//
//  Created by Ari on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class StartViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var arinstructions: UIImageView!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var cyborgImg: UIImageView!
    @IBOutlet var holder: UIView!
    @IBOutlet var cyborgText: UIImageView!
    
    @IBOutlet var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a new scene
        sceneView.scene = SCNScene()
        // Use default lighting
        sceneView.autoenablesDefaultLighting = true
        
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sceneView.addSubview(blurEffectView)
        self.holder.backgroundColor = UIColor.init(red:0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        self.arinstructions.isHidden = true
        self.cyborgText.isHidden = true
        self.nextButton.isHidden = true
        self.sceneView.addSubview(self.holder)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
        // Create a transform with a translation of 0.2 meters in front of the camera.
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.2
       // let transform = simd_mul((sceneView.session.currentFrame?.camera.transform)!, translation)
        
        // Add a new anchor to the session.
       // let anchor = ARAnchor(transform: transform)
       // sceneView.session.add(anchor: anchor)
        
        // (Elsewhere...) Provide a label node to represent the anchor.
        
        
    }
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        return SKLabelNode(text: "👾")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let alert = UIAlertController(title: "New Mission", message: "Cyborg has a new mission for you. Would you like to accept his request?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true) {
            self.cyborgText.isHidden = false
            self.nextButton.isHidden = false
        }
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
     
     */

    @IBAction func Next(_ sender: Any) {
        
        if(self.nextButton.image(for: .normal) == #imageLiteral(resourceName: "next")){
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.cyborgText.alpha = 0.0
            self.nextButton.alpha = 0.0
        }, completion: {
            (finished: Bool) -> Void in
            self.cyborgText.image = #imageLiteral(resourceName: "Cyborg2")
           self.nextButton.setImage(#imageLiteral(resourceName: "start"), for: .normal)
            
            
            // Fade in
            UIView.animate(withDuration: 0.6, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.cyborgText.alpha = 1.0
                self.nextButton.alpha = 1.0
            }, completion: nil)
        })
        
    }
            
    else{
            
            self.sceneView.subviews[0].removeFromSuperview()
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.cyborgText.alpha = 0.0
                self.nextButton.alpha = 0.0
                self.cyborgImg.alpha = 0.0
                self.arinstructions.isHidden = false
                self.arinstructions.alpha = 1.0
            }, completion: {
                (finished: Bool) -> Void in
           
                UIView.animate(withDuration: 5.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                    self.arinstructions.alpha = 0.0
                }, completion: {
                    (finished: Bool) -> Void in
                  self.arinstructions.alpha = 1.0
                    
                    
                    // Fade in
                    UIView.animate(withDuration: 5.0, delay: 5.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                           self.arinstructions.alpha = 0.0
                        }, completion: {
                            (finished: Bool) -> Void in
                            self.holder.isHidden = true
                           //self.arinstructions.alpha = 1.0
                            
                            
                            // Fade in
                            
                        })
                    }, completion: nil)
                })
                
                
            })
           // print("subviews", self.view.subviews)
            
    }
}
}
