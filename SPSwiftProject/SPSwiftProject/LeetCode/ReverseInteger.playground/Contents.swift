// Reverse Integer

func reverseNumber(num: Int) -> Int {
    var number = num
    var reverseNumber: Int = 0
    while number != 0 {
        reverseNumber = (reverseNumber * 10 ) + (number % 10)
        number = number / 10
    }
    return reverseNumber
}

var number = 12345
print(reverseNumber(num: number))

