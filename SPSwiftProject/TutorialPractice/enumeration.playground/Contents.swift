// Enumeration

enum DaysofaWeek {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
}

var day = DaysofaWeek.Sunday
//day = .Saturday

switch day {
case .Monday:
    print("Monday")
case .Tuesday:
    print("Tuesday")
case .Wednesday:
    print("Wednesday")
case .Thursday:
    print("Thursday")
case .Friday:
    print("Friday")
default:
    print("Weekend")
}

// Enumerate with Associative values
// ie: different data types

enum WithAssociativeValue {
    case Student(String)
    case Marks(Int, Int, Int)
}

//var studDetails = WithAssociativeValue.Student("John")
//var studMarks = WithAssociativeValue.Marks(10, 20, 30)

var tempValue = WithAssociativeValue.Student("Pink")
var tempValue1 = WithAssociativeValue.Marks(10, 20, 30)

switch tempValue1 {
case .Student(let name):
    print(tempValue1, name)
case .Marks(let v1, let v2, let v3):
    print(tempValue1, v1,v2,v3)
}
