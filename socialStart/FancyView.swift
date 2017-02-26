//
//  FancyView.swift
//  socialStart
//
//  Created by Thomas Hawing on 2/26/17.
//  Copyright © 2017 Thomas Hawing. All rights reserved.
//

import UIKit

class FancyView: UIView {

    
    //this override function will give a shadow boarder around anything that it is applied to in the aspect editor 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }

}
