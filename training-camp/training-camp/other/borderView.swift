//
//  borderView.swift
//  training-camp
//
//  Created by Amanda Southworth on 7/8/17.
//  Copyright © 2017 Amanda Southworth. All rights reserved.
//

import UIKit

class borderView: UIView {

    override func draw(_ rect: CGRect) {
        
        backgroundColor = UIColor.clear
        layer.borderWidth = 2
        layer.borderColor = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0).cgColor
    }
}
