//
//  main.swift
//  Classes and Objects
//
//  Created by Aaryan Garg on 28/11/18.
//  Copyright © 2018 Aaryan. All rights reserved.
//

import Foundation

print("Hello, World!")

// Designated Initalizer
let myCar = Car()
print(myCar.color)
print(myCar.numberOfSeats)
print(myCar.typeOfCar)

// Convenience Initalizer
let myCustomeCar = Car(customerSeletedColor: "Red")
print(myCustomeCar.color)
print(myCustomeCar.numberOfSeats)
print(myCustomeCar.typeOfCar)

// Method Example
let objCar = Car()
objCar.drive()

// Inheritence
let mySelfDrivingCar = SelfDriverCar()
// Accessing drive method of Car class
mySelfDrivingCar.drive()
// Accessing color property of Car class
print(mySelfDrivingCar.color)
