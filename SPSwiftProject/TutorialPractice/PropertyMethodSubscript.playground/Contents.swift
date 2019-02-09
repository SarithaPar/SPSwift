// Properties:
// - Lazy Store Property: No initialization value for the first time.
//      - It delay object creation
//      - It depends on another part of code (eg: Another class)
// - WillSet Property: Property called before storing the value
// - didSet Property: Property called after storing the value
//
// Subscript: Subscripting Collection/Sequence/list in Classes/Structures/Enumerations
// Syntax:
//
//subscript(index: Int) -> Int {
//    get {
//        // used for subscript value declarations
//    }
//    set (newValue) {
//        // definitions are written here
//    }
//}


struct Number {
    var digits: Int
    let pi = 3.1415
}

var n = Number(digits: 12345)
n.digits = 67

print(n.digits)
print(n.pi)

// Lazy Property
class name {
    var studentName = "John"
}

class sample {
    lazy var sampleName = name()
}

var firstStudent = sample()
print(firstStudent.sampleName.studentName)

// WillSet and DidSet Property

class SampleClass {
    var counter: Int = 0{
        willSet(newCounter) {
            print(newCounter)
        }
        didSet{
            if counter > oldValue {
                print(counter, oldValue)
            }
        }
    }
}
let newCounter = SampleClass()
newCounter.counter = 10
newCounter.counter = 30

// SubScript:
class SubScriptExample {
    var number: Int
    init (number: Int){
        self.number = number
    }
    subscript(index: Int) -> Int {
        return number
    }
}

let numb = SubScriptExample(number: 10)
print("Subscript[0]: \(numb[0])")
print("Subscript[2]: \(numb[2])")

class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}
var p = daysofaweek()
print(p[0])
print(p[3])

