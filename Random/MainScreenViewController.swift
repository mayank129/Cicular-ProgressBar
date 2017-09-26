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
    var completed = 90.0
    override func viewDidLoad() {
        super.viewDidLoad()
        circleView.percentageComplete = self.completed/100
        profileInfo.text = "\(completed)%"
       // circleView.percentageComplete = self.completed/100
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
