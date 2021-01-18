// 1. Map
// 2. compactMap
// 3. flatMap
// 4. reduce
// 5. lazy
//

let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowercaseNames = cast.map {$0.lowercased()}
let letterCounts = cast.map { $0.count }
print(lowercaseNames)
print(letterCounts)

// 
