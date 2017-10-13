//
//  MainScreenViewController.swift
//  Random
//
//  Created by Mayank on 25/09/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    @IBOutlet weak var profileInfo: UILabel!
    @IBOutlet weak var circleView: CustomView!
    var completed = 100.0
    var labelValue:Int = 0
    var myTime:Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // circleView.percentageComplete = self.completed/100
      // profileInfo.text = "\(completed)%"
       // circleView.percentageComplete = self.completed/100
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startUpdate(){
        myTime = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func update(){
        if labelValue < Int(completed) {
            labelValue = labelValue + 1
           profileInfo.text = "\(labelValue)%"
            
        }
        else{
            myTime.invalidate()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        startUpdate()
        circleView.percentageComplete = self.completed/100
        circleView.setNeedsDisplay()
        
    }


}
