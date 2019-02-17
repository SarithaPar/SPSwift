// Program to convert roman to integer
// eg: 3 = III, 4 = IV, 9 = IX,
// 1994: MCMXCIV,
// Assumption: Number lies between 0 - 3999

var intRomanSet:[Character: Int] = ["I":1, "V":5, "X":10, "L":50, "C": 100, "D": 500, "M": 1000]

func convertIntegerToRoman(intNumber : Int) -> String {
    if (intNumber < 1) || (intNumber > 3999) {
        return "out of range"
    }
    var romanString = ""
    var number = intNumber
    
    while (number >= 1000) {
        romanString += "M"
        number -= 1000
    }
    while (number >= 900) {
        romanString += "CM"
        number -= 900
    }
    while (number >= 500) {
        romanString += "D"
        number -= 500
    }
    while (number >= 400) {
        romanString += "CD"
        number -= 400
    }
    while (number >= 100) {
        romanString += "C"
        number -= 100
    }
    while (number >= 90) {
        romanString += "XC"
        number -= 90
    }
    while (number >= 50) {
        romanString += "L"
        number -= 50
    }
    while (number >= 40) {
        romanString += "XL"
        number -= 40
    }
    while (number >= 10) {
        romanString += "X"
        number -= 10
    }
    while (number >= 9) {
        romanString += "IX"
        number -= 9
    }
    while (number >= 5) {
        romanString += "V"
        number -= 5
    }
    while (number >= 4) {
        romanString += "IV"
        number -= 4
    }
    while (number >= 1) {
        romanString += "I"
        number -= 1
    }
    return romanString
}

public class RomanToNumber
{
    // This function returns value of a Roman symbol
    func value(r : Character) -> Int {
        if (r == "I") { return 1 }
        if (r == "V") { return 5 }
        if (r == "X") {return 10 }
        if (r == "L") {return 50 }
        if (r == "C") {return 100}
        if (r == "D") {return 500}
        if (r == "M") {return 1000}
        return -1
    }
    
//    func convertRomanToInteger(roman : String) -> Int {
//    // Initialize result
//        var res = 0;
//
////        for (int i=0; i<str.length(); i++) {
//        for (index, char) in roman.enumerated() {
//            // Getting value of symbol s[i]
//            int s1 = (Int)char;
//
//        // Getting value of symbol s[i+1]
//            if (i+1 < str.length())
//            {
//            int s2 = value(str.charAt(i+1));
//
//            // Comparing both values
//            if (s1 >= s2)
//            {
//                // Value of current symbol is greater
//                // or equalto the next symbol
//                res = res + s1;
//            }
//            else
//            {
//                res = res + s2 - s1;
//                i++; // Value of current symbol is
//                // less than the next symbol
//            }
//        }
//        else
//        {
//            res = res + s1;
//            i++;
//        }
//    }
//
//    return res;
//    return 0
//}
}

var integerValue = 58
var romanValue: String = ""
romanValue = convertIntegerToRoman(intNumber: integerValue)
//integerValue = convertRomanToInteger(roman: romanValue)
print("Integer: \(integerValue), Roman: \(romanValue)")
