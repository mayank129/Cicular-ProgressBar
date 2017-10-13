//
//  RatingLabel.swift
//  Random
//
//  Created by Mayank on 12/10/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class RatingLabel: UILabel {
    
    let total = 5
    var unit:CGFloat = 0
    var rate = 0
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = frame.width
        unit = width/CGFloat(total)
        print("unit \(width)")
    }
    
    func showRating(location :CGPoint ){
//        print(location.x)
//        print(floor(location.x/unit))
        rate = Int(floor(location.x/unit))
        var str = ""
        for i in 0 ... 4{
            if i <= rate{
                str += "★"
            }
            else{
                 str += "☆"
            }
        }
        text = str
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: self)
        showRating(location: location)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        showRating(location: location)
    }

}
