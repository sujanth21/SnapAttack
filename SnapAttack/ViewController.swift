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
            
            cardTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCards), userInfo: nil, repeats: true)
        }
        
        if gameMode == 1 {
            
            if firstCard.image == secondCard.image {
                scoreInt += 1
                scoreLabel.text = "Score: \(scoreInt)"
            } else {
                scoreInt -= 1
                scoreLabel.text = "Score: \(scoreInt)"
            }
        }
        
    }
    
    @objc func updateTimer() {
        timeInt -= 1
        timeLabel.text = "Time: \(timeInt)"
        
        gameMode = 1
        
        if timeInt == 0 {
            timer.invalidate()
            cardTimer.invalidate()
            gameMode = 0
        }
    }
    
    @objc func updateCards() {
        
        let cards = ["ace_of_hearts", "2_of_hearts", "3_of_hearts", "4_of_hearts", "5_of_hearts", "6_of_hearts", "7_of_hearts", "8_of_hearts", "9_of_hearts", "10_of_hearts"]
        
        let random1 = Int(arc4random_uniform(UInt32(cards.count)))
        firstCard.image = UIImage(named: cards[random1])
        
        let random2 = Int(arc4random_uniform(UInt32(cards.count)))
        secondCard.image = UIImage(named: cards[random2])
    }
    
}

