
// Creating Simple Function (getMilk)
func getMilk() {
    print("go to more")
    print("buy 2 liters of milk")
    print("pay 92 rs by milk card")
    print("come back home")
}

// Calling funtion
getMilk()

// Creating function with inputs
func getMilk(quanity: Int) {
    print("go to more")
    print("buy \(quanity) liters of milk")
    
    let priceToPay = quanity * 46
    
    print("pay \(priceToPay)rs by milk card")
    print("come back home")
}

// Calling function with input
getMilk(quanity: 4)

// Creating function with Inputs and Output
func getMilk(quanity: Int, totalMoneyGiven: Int) -> Int {
    print("go to more")
    print("buy \(quanity) liters of milk")
    
    let priceToPay = quanity * 46
    
    print("pay \(priceToPay)rs by milk card")
    print("come back home")
    
    let change = totalMoneyGiven - priceToPay
    return change
}
// Calling function with inputs and output
let balance = getMilk(quanity: 2, totalMoneyGiven: 805)

print("Hello masster, here's your \(balance) rs change")

