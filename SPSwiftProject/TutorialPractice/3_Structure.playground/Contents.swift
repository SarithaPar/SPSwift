import UIKit

// structure
// Value type

struct User
{
	var name: String
	var age: Int
	var address: String
	
	func printUserInfo() -> String {
		return "name: \(name), age: \(age), address: \(address)"
	}
}

let user1 = User(name: "SS", age: 23, address: "my address")
var user2 = user1
user1.printUserInfo()

user2.printUserInfo()

user2.name = "SP"
user2.printUserInfo()
user1.printUserInfo()
