// Closures
// What are Closures
// When to use Closures:
// Example: DAta parsing using API. Runs parallely with operation in background
// How to use Closures


// Regular func
func additionOfNumber(number1: Int, number2: Int) -> Int {
	return number1 + number2
}

// Detail closure
var additionOfTwo:(Int, Int) -> Int = { // Tells that to get variable Int value, input 2 int value
	(number1, number2) in				// The two input value will be called number1, number2.
										// Actual body starts after in
	return number1 + number2			// Operation to perform in closure
}
 
// Compact closure
var additionOfTwo1:(Int, Int) -> Int = {
	return $0 + $1						// Two input are in order $0  and $1
}

print(additionOfNumber(number1: 10, number2: 15))
print(additionOfTwo(10,16))
print(additionOfTwo1(10,16))

//=======================================================
//==== Closure (Escping, non-escaping, autoclosure) =====
//=======================================================

/*
1. Syntax revision of closure
2. typealias with closure syntax
3. function call sequence with closure
4. autoclosure
5. escaping and non-escaping



*/

// Simple closure

var additionClosure: (_ number1: Int, _ number2: Int) -> Int =
{
	(_ number1: Int, _ number2: Int) -> Int in
	return number1 + number2
}

debugPrint("Addition Result = \(additionClosure(3,5))")

// Typealias

typealias AddTwoNumeberClosure = (_ number1: Int, _ number2: Int) -> Int



// function call sequence with closure

//=============================
//===== Some more example1 =====

func divide (val1: Int, val2: Int) -> Int {
	return val1 / val2
}
let answer = divide(val1: 10, val2: 2)

let divide1 = {
	(val1: Int, val2: Int) -> Int in
		return val1 / val2
}
let answer1 = divide1(20, 5)
print(answer, answer1)


//=============================
//===== Some more example2 - String compare =====

func ascend(s1: String, s2: String) -> Bool {
	return s1 > s2
}
let stringcmp = ascend(s1: "Swift", s2: "great")

let ascend1 = {
	(s1: String, s2: String) -> Bool in
	return s1 > s2
}
let stringcmp1 = ascend1("Swift", "great")
print(stringcmp, stringcmp1)

//=============================
//===== Single Expression Implicit Returns =====

var count: [Int] = [5, 10, -6, 75, 20]
var descending = count.sorted(by: {
	n1, n2 in
	n1 > n2
})
var ascending = count.sorted(by: {
	n1, n2 in n1 < n2
})
print(descending)
print(ascending)


//=============================
//===== Closures as Trailers =====
// Eg: reversed = sorted(names) {$0 > $1}
// where {$0 > $1} are represented as trailing closures declared outside (names)

//import Foundation
//var letters = ["North", "East", "West", "South"]
//
//let twoletters = letters.map({
//	(state: String) -> String in
//	return state.substringToIndex(advance(state.startIndex, 2)).uppercaseString
//
//})
//let stletters = letters.map() {
//	$0.substringToIndex(advance($0.startIndex, 2)).uppercaseString
//}
//print(stletters)

