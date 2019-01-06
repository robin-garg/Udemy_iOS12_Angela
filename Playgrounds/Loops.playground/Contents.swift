//: A UIKit based Playground for presenting user interface
  
import UIKit

let arrayOfNumbers = [1,5,4,3,7,2,6,8]
var sum = 0
for number in arrayOfNumbers {
    sum += number
}
print(sum)
print("---")
for number in 1...10 {
    print(number)
}
print("---")
for number in 1..<10 where number % 3 == 0 {
    print(number)
}

// Example: 99 Bottles of beer
func beerSong(totalBeer: Int) -> String {
    var lyrics = ""
    for beer in (0...totalBeer).reversed() {
        var newLine = ""
        if (beer == 0) {
            newLine = "\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
        } else if (beer == 1) {
            newLine = "\n1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n"
        } else {
            newLine = "\n\(beer) bottle of beer on the wall, \(beer) bottle of beer.\nTake one down and pass it around, \(beer-1) bottles of beer on the wall.\n"
        }
        lyrics += newLine
    }
    return lyrics
}

let lyrics = beerSong(totalBeer: 1)
print(lyrics)

// Example Fibonacci (1, 1, 3, 5, 8, 13, ...)
func fibonacci(until: Int) {
    var a = 1, b = 0
    for _ in 1...5 {
        var c = a+b
        a = b
        b = c
        print(c)
        
    }
}

fibonacci(until: 5)
