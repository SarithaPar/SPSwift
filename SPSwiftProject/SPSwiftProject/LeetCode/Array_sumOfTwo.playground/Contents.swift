//Given an array of integers, return indices of the two numbers such that they add up to a specific target
// https://leetcode.com/problems/two-sum/

let nums = [2,7,11,15]
let target = 22

func remainderIsPresent(num: [Int], remainder: Int) -> Bool{
    for n in num {
        if n == remainder {
            return true
        }
    }
    return false
}

func sumOfTwo(num: [Int], target: Int) -> (Int, Int) {
    for n in num {
        let remainder = target - n
        if remainderIsPresent(num: num, remainder: remainder) {
            return (n, remainder)
        }
    }
    return (0, 0)
}

print(sumOfTwo(num: nums, target: target))

// Solve program using dictionary key, value

struct TwoSumArray {
    let numberList: [Int]
    let targetSum: Int
    
    init(numberList: [Int], targetSum: Int ) {
        self.numberList = numberList
        self.targetSum = targetSum
    }
}

struct ArrayToDictionary {
    var numberDictionary = [Int : Int]()
    
    mutating func addNumberToDictionary(key: Int) {
        for (keyInDict, value) in numberDictionary {
            if (key == keyInDict) {
                if value > 0 {
                    self.numberDictionary.updateValue(1, forKey: key)
                    break
                }
            }
        }
    }
}

func convertArrayToDictionary (array: [Int]) -> [Int: Int]{
    var numberDictionary = [Int : Int]()
    for value in array {
        numberDictionary.updateValue(1, forKey: value)
    }
    return numberDictionary
}

func findSumOfTwo(dict: [Int:Int], sumRequired: Int) -> Void { //-> [Int, Int] {
    var remainder = 0
    for (key, value) in dict {
        remainder = sumRequired - key
        //print("key: \(key) ,remainder: \(remainder)")
        //print(dict[key])
        if dict.keys.contains(remainder) {
            print(key, remainder)
           //return [key, remainder]
            break
        }
    }
    //print("no combination found")
    //return [0, 0]
}

var list: [Int] = [2,7,11,15]
var sumRequired = 17
var twoSumArray = TwoSumArray(numberList: list, targetSum: sumRequired)
var arrayInDictionary = convertArrayToDictionary(array: list) //ArrayToDictionary()

findSumOfTwo(dict: arrayInDictionary, sumRequired: sumRequired)

