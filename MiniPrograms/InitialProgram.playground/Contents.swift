// Program to compare string

func compareName (s1:String, s2: String) -> Bool{
    return s1 > s2
}

let nameOne = "Aman"
let nameTwo = "asha"
print(compareName(s1: nameOne, s2: nameTwo))

// Progrom to compare two array

var list: [Int] = [3,6,1,8,7,2]
let ascending = list.sorted(
    by: {
        n1, n2 in n1 > n2
    }
)

func compare (n1: Int, n2: Int) -> Bool {
    return n1 > n2
}


