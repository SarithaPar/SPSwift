import UIKit

// Function

func student(name: String, age: Int?) -> String{
    if let newAge = age {
        let nameAge = name + String(newAge)
        return nameAge
    }
    return name
}

var student1 = student(name: "Aman", age: 10)
var student2 = student(name: "Aman", age: nil)
print(student1)
print(student2)

// Program to find largest and smallest number from array
func findLargestSmallest(number: [Int]) -> (Int, Int) {
    var number1: [Int] = number.sorted()
    let smallest = number1[0]
    let largest = number1[number1.count - 1]
    return (smallest, largest)
}

var listOfNumber = [45,23,87,35,12,66,88]
print(findLargestSmallest(number: listOfNumber))

/// Closure

let studname = {print("Student name is Aman")}
studname()

// Closure accepting input and output
let division = {
    (val1: Int, val2: Int) -> Int in
        return val1/val2
}
let result = division(200, 20)
print(result)


