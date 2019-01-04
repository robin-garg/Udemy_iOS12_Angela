//
//  CalculatorLogic.swift
//  CalculatorApp
//
//  Created by Aaryan Garg on 01/01/19.
//  Copyright © 2019 Aaryan. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermediateCalculation: (firstNum: Double, operation: String)?
    
    mutating func set(Number num: Double) {
        number = num
    }
    
    mutating func calculate(operation: String) -> Double? {
        guard let num = number else {
            return nil
        }
        switch operation {
        case "+/-":
             return num * -1
        case "AC":
            return 0
        case "%":
            return num / 100
        case "=":
            return performTwoNumCalculation(num2: num)
        default:
            intermediateCalculation = (num, operation)
            return nil
        }
    }
    
    func performTwoNumCalculation(num2: Double) -> Double? {
        if let num1 = intermediateCalculation?.firstNum,
            let operation = intermediateCalculation?.operation {
            
            switch operation {
            case "÷":
                return num1 + num2
            case "-":
                return num1 - num2
            case "x":
                return num1 * num2
            case "/":
                return num2 / num2
            default:
                return nil
            }
        }
        return nil
    }
}
