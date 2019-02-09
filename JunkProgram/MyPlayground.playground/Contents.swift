//add two number

let one = 1
let two = 2
let add = {
    (one: Int, two: Int) -> Int in
    return one + two
    
}
let three = add(one, two)
let four = 

var arr1 = [1,2,3,4,5]
var arr2 = [10,9,8,7]
var arr3 = arr1 + arr2
print(arr3.sorted())

var arr4 = [1,2,3,3,5,7,2]
var set5: Set<Int> = []
for item in arr4 {
    set5.insert(item)
}
print(set5)

var str1 = "saritha"
var str2 = "parsoya"
var str3 = str1 + str2
print(str3)
print(str3.sorted())

var strSet4: Set<Character> = []
for n in str3 {
    strSet4.insert(n)
}
print(strSet4)

var dic1: [String: Int] = ["one": 1, "two": 2, "three":3]
for (key, value) in dic1 {
    print(key, value)
}
