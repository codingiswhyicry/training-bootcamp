//
//  green_lantern.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit
import ARKit

class green_lantern:UIViewController, SCNSceneRendererDelegate, ARSessionDelegate, ARSCNViewDelegate, UITextFieldDelegate {
    
    func levelOne() {
        
        
    }
    
    func levelTwo() {
        
        
    }
    
    func levelThree() {
        
        
    }
    
    func levelFour() {
        
        
    }
    
    func levelFive() {
        
        
    }
    
    func help() {
        
        addString(string: "Here's a list of commands and what they do: ")
        
        switch ranking {
            
        case 1:
            for command in level1 {
                
                addString(string: command)
            }
            break
            
        case 2:
            for command in level2 {
                
                addString(string: command)
            }
            break
            
        case 3:
            for command in level3 {
                
                addString(string: command)
            }
            break
            
        case 4:
            for command in level4 {
                
                addString(string: command)
            }
            break
            
        case 5:
            for command in level5 {
                
                addString(string: command)
            }
            break
            
        default:
            
            addString(string: "sorry, not found!")
            
            break
        }
        
    }
    
    var level1: Array <String> = ["help : brings you to the help menu", "list: lists files on the computer", "delete: deletes files", "open: opens a file"]
    var level2: Array <String> = ["help : brings you to the help menu", "list: lists files on the computer", "delete: deletes files", "share: shares the file", "open: opens a file"]
    var level3: Array <String> = ["help : brings you to the help menu", "list: lists files on the computer", "delete: deletes files", "share: shares the file", "connect: connects to someone's computer", "open: opens a file"]
    var level4: Array <String> = ["help : brings you to the help menu", "list: lists files on the computer", "delete: deletes files", "share: shares the file", "connect: connects to someone's computer", "show: shows hidden files", "open: opens a file"]
    var level5: Array <String> = ["help : brings you to the help menu", "list: lists files on the computer", "delete: deletes files", "share: shares the file", "connect: connects to someone's computer", "show: shows hidden files", "edit: edits a file", "open: opens a file"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let final_scores = segue.destination as? final_score {
            final_scores.level = ranking
        }
    }
    
    func checkInput(string: String) {
        
        if string == "help" || string == "Help" || string == " Help" || string == "HELP" || string == "help " {
            
            help()
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        let text: String = textField.text!
        var levelOneFiles: Array<String> = ["family.png", "reciepes.txt", "targets.txt", "dogs.png"]
        
        addString(string: text)
        switch text {
            
        case "list" :
            for file in levelOneFiles {
                
                addString(string: file)
            }
            
            break
            
        case "delete":
            
            addString(string: "please specify the file!")
            
            break
            
        case "delete targets.txt":
            self.performSegue(withIdentifier: "toScore", sender: self)
            break
            
        default:
            checkInput(string: text)
            //addString(string: "command not found. try again.")
            break
        }
        
        checkInput(string: text)
        
        return true
    }
    
    func addString(string: String) {
        
        var textString: String =  "iPhone-$:  "
        
        textString += string
        
        textString += "\n"
        
        terminalText += textString
        
        textView.text = terminalText
    }
    
    
    func runTerminal(level: Int) {
        
        print("running terminal")
        
        switch level {
            
        case 1:
            addString(string: "Deadshot has a list of Targets on his computer to hurt in future missions. Headquaters has connected you with his computer. Find the file “targets.txt” and delete it within 2 minutes, or risk being caught!")
            levelOne()
            break
            
        case 2:
            addString(string: "Batman is on his way to save a citizen, but he can’t remember his exact location! Find and share the coordinates.rtf file with Batman within 3 minutes, or risk being caught!")
            levelTwo()
            break
            
        case 3:
            addString(string: "the Joker has a file of nuclear code on his computer. Connect to his computer from headquarters, and delete the file “nukes.txt”.")
            levelThree()
            break
            
        case 4:
            addString(string: "Doctor Poison has finally found the most dangerous chemical compound, and has just sent it to a list of villains within the Gotham area. She has hidden the file of those who she sent to, find the file, send it to Batman, and delete it before she returns to her computer in 5 minutes!")
            levelFour()
            break
            
        case 5:
            addString(string: "Lex Luthor is hosting a party in Gotham. He sent a list of chemicals to his chefs to be put into the food. Find the file with the head chef’s name, hack into her computer, and replace the names of chemicals with vegetables. ")
            levelFive()
            break
            
        default:
            print("oh no")
        }
    }
    
    func selectLevel() -> Int {
        
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = ARSessionConfiguration()
        // Create an AR Session
        let arSession = ARSession()
        
        // Nominate self for session delegation
        arSession.delegate = self
        
        // Run the session
        arSession.run(configuration)
        
        sceneView.delegate = self
        
        backText.backgroundColor = UIColor.clear
        backText.layer.borderWidth = 2
        backText.layer.borderColor = UIColor(red:0.40, green:1.00, blue:0.40, alpha:1.0).cgColor
        
        textView.isEditable = false
        textField.delegate = self
        
        runTerminal(level: ranking)
        
        // Do any additional setup after loading the view.
    }
    var terminalText: String = ""
    
    var ranking: Int = 1
    
    var levelArray: Array<Int> = [1, 2, 3, 4, 5]
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backText: UIView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var backing: UIView!
}


