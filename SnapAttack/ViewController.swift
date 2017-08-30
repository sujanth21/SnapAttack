//
//  ViewController.swift
//  SnapAttack
//
//  Created by Sujanth Sebamalaithasan on 30/8/17.
//  Copyright © 2017 Sujanth Sebamalaithasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var startBtn: UIButton!
    
    var timer = Timer()
    var cardTimer = Timer()
    
    var timeInt = 20
    var scoreInt = 0
    var gameMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startBtnPressed(_ sender: Any) {
        
        if timeInt == 20 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func updateTimer() {
        timeInt -= 1
        timeLabel.text = "Time: \(timeInt)"
        
        if timeInt == 0 {
            timer.invalidate()
        }
    }
    
}

