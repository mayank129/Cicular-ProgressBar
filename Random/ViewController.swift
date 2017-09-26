//
//  ViewController.swift
//  Random
//
//  Created by Mayank on 25/09/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextPage(_ sender: UIButton) {
        let VC1 = self.storyboard?.instantiateViewController(withIdentifier: "CircularVC") as! MainScreenViewController
        self.navigationController!.pushViewController(VC1,animated: true)
    }
  
  

}

