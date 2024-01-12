import UIKit


//for (int i = 0 ; i < 10 ;i++){
//
//}
var value : Int = 0
var totalOfOdd = 0
for value in 460...1060 {
    if value % 2 == 1 {
        totalOfOdd += value
    }
}

var year = 2024
var semeste = "Winter"
print ("Welcome to \(year) at Humber College \(semeste) Semester")

print("The total number of odd values between 460 and 1060 is \(totalOfOdd) ")



var str1 : String? = "ios1"
var str2 : String? = "ios2"

print(str1!)

if let g = str2 {
    print(g)
}


//Java function
//int mysecondfunc (int a, int b){
//    return a + b;
//}
//mysecondfunc(2,3);
var hello : String
hello = ""
print(hello)

var c : Int = 5
var d : Int = 5
var result = c + d

var dc : Double = 5.2
var dd : Double = 5.4
var dresult: Int = Int(dc + Double(c))

var doublestring = "0.2"
var doubleFromString : Double? = Double(doublestring)

var intstring = "hello"
var intfromString : Int? = Int(intstring)

// optional binding
if let goodintFromString = intfromString {
    print(goodintFromString)
}
if let gooddoubleFromString = doubleFromString {
    print(gooddoubleFromString)
}

//print(doubleFromString)
//print(intfromString)



var 🙏 = "Have a blessing day"
print(🙏)

func mysecondFunc (a: Int, b:Int)-> Int {
    
    return a + b
}
mysecondFunc(a: 22, b: 33)



var myfirstFunc : (Int, Int)->Int = {(a: Int, b: Int) in
    return a + b
}

myfirstFunc(2,3)
myfirstFunc(2,30)


print("Winter 24", "Humber College", "iOS1", separator: ",",terminator: ".")



class Bag {
    
    var size : Int = 0
    var color: String = ""
    var price : Double = 0.0
    
}



class BagClass {
    var size : String
    var color: String
    var price : Double
    
    init(size: String, color: String, price: Double) {
        self.size = size
        self.color = color
        self.price = price
    }
    
        func clean(length: Int, material: String)-> Void {
            //
            print("Clean this bag for \(length)m using \(material).")
        }
    func clean (length: Int, material: String, every: Int)-> Void {
        //
        print("Clean this bag every \(every) days for \(length) m using \(material).")
    }
}

class TravelBag : BagClass {
    var weight : Double = 0.0
    var width: Double = 0.0
    var length : Double = 0.0
    
    init(size:String, color:String, price: Double, weight: Double, width: Double, length: Double) {
        super.init(size: size, color: color, price: price)
        self.weight = weight
        self.width = width
        self.length = length
        
    }
    
    override func clean(length: Int, material: String)-> Void {
        print("Clean this travel bag for \(length)m using \(material).")
    }
}

var myNiceGreenBag = BagClass(size: "Big", color: "Green", price: 20.3)
myNiceGreenBag.clean(length: 2, material: "Tide", every: 30)
