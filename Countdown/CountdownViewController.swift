//
//  CountdownViewController.swift
//  Countdown
//
//  Created by Alex on 5/1/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {

    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
    }
    @IBAction func resetBtnPressed(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
