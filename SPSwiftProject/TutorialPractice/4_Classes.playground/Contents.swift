import UIKit

// Classes - 1. blue print
// item required - Variable
// what it is supposed to do - Function
// 2. Reference type

class Calculator
{
	func addTwoNumbers(firstNumber: Int, secondNumber: Int) -> Int
	{
		return firstNumber + secondNumber
	}
}

let objCalculator = Calculator()
print("Addition = \(objCalculator.addTwoNumbers(firstNumber: 10, secondNumber: 40))")
