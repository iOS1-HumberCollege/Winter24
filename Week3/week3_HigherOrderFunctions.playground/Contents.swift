import UIKit


// map, filter, reduce

// Higher order function = the functtion that has one parameter as a clouser.

var dogs : [String: Int] = ["Fido": 2 ,
                            "LoLo": 10,
                            "Spark":1]

print( dogs.map { (name,age) in
        return "The doge name is \(name) and its age is \(age)"
})
print(dogs.map({"The doge name is \($0) and its age is \($1)"}))




var stringarray = ["a","b","c","d"]

print(stringarray.map { letter in
    return letter.uppercased()
})
print(stringarray.map({$0.uppercased()}) )
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
var shortcut = prices.map {$0 * 1.13}
print(shortcut)

// filter
print( prices.filter { price in
    return price <= 50.0
})
print( prices.filter {$0>50.5})

// reduce

var totalPrice = prices.reduce(0) { partialResult, price in
    return partialResult + price
}
print(totalPrice)

 names.reduce("Thanks for joining Us: ") { partialResult, name in
    return partialResult + " \(name)"
}
var allNames = names.reduce("", {$0 + " \($1)"})


print(allNames)


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
