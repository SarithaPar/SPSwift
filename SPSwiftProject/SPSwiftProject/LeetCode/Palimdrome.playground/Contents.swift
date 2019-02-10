// palindrome number/string
// Eg: Mom, 12321

func isPalindrome(originalString: String) -> String {
    
    originalString.lowercased()
    var reverseString = originalString.reversed()
    print(reverseString, originalString)
//    if (originalString == originalString.reversed()) {
//        return originalString
//    }'
    return "abc"
}

func isPalindrome1(word: String) -> Bool {
    let word = word.lowercased().filter {
        $0 != " "
        
    }
    print(word)
    
    return (word == String(word.reversed()))
}


var originalString = "car'ac"
print(isPalindrome(originalString: originalString))
print(isPalindrome1(word: originalString))
