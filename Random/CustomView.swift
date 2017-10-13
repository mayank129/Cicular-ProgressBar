//
//  CustomView.swift
//  Random
//
//  Created by Mayank on 25/09/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class CustomView: UIView {
    var circleLayer: CAShapeLayer!
    var percentageComplete = 0.0
    
    override func draw(_ rect: CGRect) {
        
        setUp(rect :rect)
        // Drawing code
    }
    func setUp(rect :CGRect)
    {
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        var transform = CGAffineTransform(translationX: rect.size.width/2, y: rect.size.height/2)
        transform = transform.rotated(by: CGFloat(270*(M_PI)/180))
        context.concatenate(transform)
        
        
        let path2 = UIBezierPath()
        path2.lineWidth = 2
        path2.move(to: CGPoint(x: 0, y: 0))
        path2.addArc(withCenter: CGPoint(x:0, y:0), radius: 95, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path2.close()
        UIColor.white.setFill()
        path2.fill()
        
        let path = UIBezierPath(arcCenter: CGPoint(x: rect.size.width/2, y:rect.size.height/2), radius: 100, startAngle: CGFloat(3 * M_PI/2), endAngle: CGFloat(7 * M_PI/2), clockwise: true)
        
        circleLayer = CAShapeLayer()
        
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 9
        
        
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = 0.0
        
        layer.addSublayer(circleLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = 1
        
       
        animation.fromValue = 0
        animation.toValue = percentageComplete
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

        circleLayer.strokeEnd = CGFloat(percentageComplete)

        circleLayer.add(animation, forKey: "animateCircle")
        
        
        
        
    }
    
}

