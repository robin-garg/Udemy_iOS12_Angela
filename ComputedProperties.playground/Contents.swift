import Foundation

// Observed Properties
var sizeOfPizza = 10 {
    willSet {}
    didSet {
        if (sizeOfPizza > 18) {
            // This will not trigger willSet or didSet
            sizeOfPizza = 18
        }
    }
}

// Stored Properties
var numberOfPersons = 6
let slicePerPerson = 4

// Computer Properties
var numberOfSlices: Int {
    get {
        return sizeOfPizza - 4
    }
    set {
       sizeOfPizza = newValue + 4
    }
}

var numberOfPizza: Int {
    get {
        let personsCanFeedPerPizza = numberOfSlices / slicePerPerson
        return numberOfPersons / personsCanFeedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPersons = totalSlices / slicePerPerson
    }
}

numberOfPizza = 4
numberOfPersons

// ------------------------- Practice --------------------------------

let width: Float = 1.5
let height: Float = 2.3

// 1 bucket of paint can paint 1.5sqm
var bucketOfPaint: Int {
    get {
    let area = width * height
    return Int(ceilf(area/1.5))
    }
    set {
        let area = Float(newValue) * 1.5
        print("We can paint \(area)sqm area")
    }
}
print(bucketOfPaint)
bucketOfPaint = 5
