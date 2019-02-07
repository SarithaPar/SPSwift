import UIKit

// Arrray example

var someInts = [Int](repeating: 10, count: 3) //[10,20,30]
var someVar = someInts[0]


someInts.append(20)
someInts += [50, 60]

print(someInts, someVar, someInts[1])
for item in someInts{
    print(item)
}

for (index, item) in someInts.enumerated() {
    print(index, item)
}

var anotherInts: [Int] = [15, 25, 35, 45, 55]
var intsc = someInts + anotherInts
print(intsc.count ,intsc)
print("Is intsc empty: \(intsc.isEmpty)")
print("============")

///////
// Sets

var someSet = Set<String>()
someSet.insert("Saritha")
someSet.insert("Aman")
someSet.remove("Saritha")
someSet.insert("Dhruvi")
someSet.insert("Rakeshji")
print(someSet.count,someSet)
someSet.sorted()

for (index, data) in someSet.enumerated() {
    print(index, data)
}

let oddNumber: Set = [5,9,11,7,13]
let evenNumber: Set = [2,6,10,4,8]
let primeNumber: Set = [2,3,5,7,11]
print(oddNumber.union(primeNumber).sorted())
print(evenNumber.intersection(primeNumber))
print(evenNumber.subtracting(primeNumber).sorted())

