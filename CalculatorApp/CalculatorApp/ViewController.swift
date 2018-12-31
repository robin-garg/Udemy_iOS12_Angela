//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Aaryan Garg on 29/12/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblValue: UILabel!
    
    var isFinishedTypingNumber: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else {
            return
        }
        
        if isFinishedTypingNumber {
            isFinishedTypingNumber = false
            lblValue.text = buttonText
        } else {
            lblValue.text = lblValue.text! + buttonText
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
    }
}

