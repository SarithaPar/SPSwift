//Control Flow

let individualScores = [10,40,20,50,90]
var teamScore = 0
for score in individualScores {
    if score > 25 {
        teamScore += score
    }
    else {
        teamScore -= score
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greetings = "Hello!"
if let name = optionalName {
    greetings = "\(greetings), \(name)"
}
print(greetings)

let vegetable = "red pepper"


switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// find the largest number in dictionary -values
let interestingNumber = [
    "Prime": [2,3,5,7,11,13],
    "Single": [3,23,45,0,4],
    "Fibonacci": [1,1,2,3,5,8]
]
var largestKey = ""
var largestValue = 0
for (key, numbers) in interestingNumber {
    for num in numbers {
        if num > largestValue{
            largestKey = key
            largestValue = num
        }
    }
}
print(largestKey, largestValue)


