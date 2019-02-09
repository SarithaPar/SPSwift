// Structure:
// Object pass by value:
// struct nameStruct {
//   ...
// }

// Class:
// Object pass by reference:

struct studentMarks {
    var mark1 = 100
    var mark2 = 200
    var mark3 = 300
}

let marks = studentMarks()
print(marks.mark1)

struct MarksStruct {
    var mark: Int
    
    init(mark: Int) {
        self.mark = mark
    }
}

var aStruct = MarksStruct(mark: 80)
var bStruct = aStruct // Pass by value
bStruct.mark = 97

print(aStruct.mark)
print(bStruct.mark)

// Class Identity Operastors

class SampleClass {
    let myPropery: String
    init(s:String) {
        myPropery = s
    }
}

func ===(lhs: SampleClass, rhs: SampleClass) -> Bool {
    return lhs.myPropery == rhs.myPropery
}
let spClass1 = SampleClass(s: "Hello")
let spClass2 = SampleClass(s: "Hello")
let spClass3 = spClass1


print(spClass1 === spClass2)
print(spClass1 === spClass3)
