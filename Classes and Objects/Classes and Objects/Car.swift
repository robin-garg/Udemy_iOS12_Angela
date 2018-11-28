//
//  Car.swift
//  Classes and Objects
//
//  Created by Aaryan Garg on 28/11/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import Foundation

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    var color = "Black"
    var numberOfSeats = 4
    var typeOfCar : CarType = .Coupe
    
    init() {
        
    }
    
    convenience init(customerSeletedColor: String) {
        self.init()
        color = customerSeletedColor
    }
    
    func drive() {
        print("Car is moving")
    }
}
