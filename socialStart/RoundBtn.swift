//
//  RoundBtn.swift
//  socialStart
//
//  Created by Thomas Hawing on 2/26/17.
//  Copyright © 2017 Thomas Hawing. All rights reserved.
//

import UIKit


// making adjustments to the facebook logo to make it round since it is only a square right now.
class RoundBtn: UIButton {

    //this override function is the same as fancyView and will give the boarder of the button a shading.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
    }
    
    //this override fucntion will make the square box an actual circle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2
    }

}
