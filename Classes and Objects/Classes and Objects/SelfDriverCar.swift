//
//  SelfDriverCar.swift
//  Classes and Objects
//
//  Created by Aaryan Garg on 28/11/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import Foundation

class SelfDriverCar: Car {
    // Optional String - It can either contains a value or nothing(nil)
    var destination: String?
    
    override func drive() {
        super.drive()
        
        // Optional binding
        if let myDestination = destination {
            print("drive towards " + myDestination)
        }
    }
}
