//
//  borderView.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class borderView: UIButton {
    
    override func draw(_ rect: CGRect) {
        
        backgroundColor = UIColor(red:0.19, green:0.41, blue:0.54, alpha: 0.2)
        layer.borderWidth = 2
        layer.borderColor = UIColor(red:0.19, green:0.41, blue:0.54, alpha:1.0).cgColor
    }
}
