//
//  ViewController.swift
//  Dicee
//
//  Created by Aaryan Garg on 19/11/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let arrDice = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var imgViewDice1: UIImageView!
    @IBOutlet weak var imgViewDice2: UIImageView!
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateDiceImages()
    }

    @IBAction func onTapRoll() {
        updateDiceImages()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
    func updateDiceImages() {
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        imgViewDice1.image = UIImage(named: arrDice[randomDiceIndex1])
        imgViewDice2.image = UIImage(named: arrDice[randomDiceIndex2])
    }

}

