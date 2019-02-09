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

//// Dictionary: Key -> Value
// Not in order
// Key should be Integer / String and unique
// Mutable


var someDict : [Int: String] = [1: "One", 2: "Two", 3: "Three"]
print(someDict)

var cities: [String] = ["Jaipur", "Delhi", "Mumbai", "Ahmedabad", "Agra"]
var population: [Int] = [25, 35, 15, 50, 20]
var cityPopulation = Dictionary(uniqueKeysWithValues: zip(cities, population))

cityPopulation.removeValue(forKey: "Agra")
cityPopulation.updateValue(100, forKey: "Mumbai")
print(cityPopulation)
print(cityPopulation.filter {$0.value > 30})

// Iterating Dictionary
for (index, keyvalue) in cityPopulation.enumerated(){
    print("index : \(index), value: \(keyvalue)")
}

let dictCity = [String](cityPopulation.keys)
let dictPopulation = [Int](cityPopulation.values)
print(dictCity, dictPopulation)
print("\n \(cityPopulation.count) => \(dictCity.count)")

var groupedCities = Dictionary(grouping: cities) {$0.last!}
print(groupedCities)
print("Population of Delhi: \(String(describing: cityPopulation["Delhi"]))")


