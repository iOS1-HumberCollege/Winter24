import UIKit


// map, filter, reduce

// Higher order function = the functtion that has one parameter as a clouser.

var names = ["Rania", "John","Mary","Lee"]
var welcomeMes = names.map { name in
    return "Welcome \(name)"
}
var newNames = names.map({"Welcome \($0)"})
print(newNames)

print(welcomeMes)

var prices = [22.99 , 33.2 ,55.99,10.1, 3.4, 90.99]
// Map
var totalprice = prices.map { price in
    return price * 1.13
}
var shortcut = prices.map({$0 * 1.13})
print(shortcut)







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

print( alter(array: names) { name in
    return "Welcome \(name) to our class"
}
       )
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
