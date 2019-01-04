//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Aaryan Garg on 29/12/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert display value to Double")
            }
            return number
        }
        set {
            if floor(newValue) == newValue {
                displayLabel.text = String(Int(newValue))
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    private var calulator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let operation = sender.currentTitle else {
            return
        }
        
        calulator.set(Number: displayValue)
        if let result = calulator.calculate(operation: operation) {
            displayValue = result
        }
    }

    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else {
            return
        }
        
        if isFinishedTypingNumber {
            isFinishedTypingNumber = false
            displayLabel.text = buttonText
        } else {
            if buttonText == "." {
                if floor(displayValue) != displayValue {
                    // . is already added so can't need to add another .
                    return
                }
                
            }
            displayLabel.text = displayLabel.text! + buttonText
        }
    }
}
