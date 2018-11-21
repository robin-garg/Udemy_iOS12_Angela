//: A UIKit based Playground for presenting user interface

//Creating a function that takes 2 inputs and 1 output
func loveCalculator (yourName : String, theirName : String) -> String {
    
    //Generating a random number between 0 and 100
    let loveScore = Int.random(in: 0 ... 100)
    
    if loveScore > 80 {
        return "Your love score is \(loveScore). You love each other like Kanye loves Kanye"
    }
    else if loveScore > 40 && loveScore <= 80 {
        return "Your love score is \(loveScore). You go together like coke and mentos"
    }
    else {
        return "Your love score is \(loveScore). No love possible, you'll be forever alone!"
    }
    
}

//Printing the output of the loveCalculator() function
print(loveCalculator(yourName: "Angela Yu", theirName: "Jack Bauer"))

// Coding Challange - BMI Calculator
//Creating a function that takes 2 inputs and 1 output
func bmiCalculator (weightInKG : Int, heightInCM : Int) -> String {
    // Convert Height to Meter from centimeters
    let heightInMeter = Float(heightInCM) / 100.0
    // Calcuate BMI
    let bmi = Float(weightInKG) / (heightInMeter * heightInMeter)
    
    if bmi > 25 {
        return "Your BMI is \(bmi). You are overweight"
    }
    else if bmi > 18.5 {
        return "Your BMI is \(bmi). You are normal weight"
    }
    else {
        return "Your BMI is \(bmi). You are underweight"
    }
    
}

//Printing the output of the bmiCalculator() function
print(bmiCalculator(weightInKG: 85, heightInCM: 167))
