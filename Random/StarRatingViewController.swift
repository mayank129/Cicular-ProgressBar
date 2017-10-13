//
//  StarRatingViewController.swift
//  Random
//
//  Created by Mayank on 12/10/17.
//  Copyright © 2017 Mayank. All rights reserved.
//

import UIKit

class StarRatingViewController: UIViewController {

    @IBOutlet var starButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        
        let tag = sender.tag
        for button in starButton
        {
            if button.tag <= tag{
                button.setTitle("★", for: .normal)
            }
            else{
                button.setTitle("☆", for: .normal)
            }
        }
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
