import UIKit


// map, filter, reduce

// Higher order function = the functtion that has one parameter as a clouser.

var myfirstFunc = {(a: Int, b: Int)-> Int in
        return a + b
}

func mySecondFunc (a: Int, b: Int) -> Int {
    return a + b
}

myfirstFunc(22,33)
mySecondFunc(a: 22, b: 33)


func doMath (a: Int, b: Int, l : (Int,Int)->Int) -> Int{
    return l(a,b)
}
doMath(a: 22, b: 33) { a, b in
    return a + b
}

doMath(a: 22, b: 33) { a, b in
    a - b
}

func alter (array : [String], changeArray : (String)->String )->[String] {
    var newArray = [String]()
    
    for item in array {
        newArray.append(changeArray(item))
    }
    return newArray
}

var names = ["Rania", "John","Mary","Lee"]


var stringarray = ["a","b","c","d"]
var toUpper : (String)->String = { (item : String) -> String in return item.uppercased()
}
alter(array: stringarray, changeArray: toUpper)

print( alter(array: stringarray) { item in
    item.uppercased()
}
)
print(alter(array: stringarray) { item in
    item + "A"
}

)
