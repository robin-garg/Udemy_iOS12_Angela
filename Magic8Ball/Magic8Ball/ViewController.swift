//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Aaryan Garg on 20/11/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let arrBall = ["ball1", "ball2", "ball3", "ball4", "ball5"]

    @IBOutlet weak var imageView: UIImageView!
    
    var randomBallIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newBallImage()
    }

    @IBAction func onTapAsk() {
        newBallImage()
    }

    func newBallImage() {
        randomBallIndex = Int.random(in: 0 ... 4)
        imageView.image = UIImage.init(named: arrBall[randomBallIndex])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        newBallImage()
    }
}

