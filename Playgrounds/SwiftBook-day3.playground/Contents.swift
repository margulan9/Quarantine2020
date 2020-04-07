import UIKit

var str = "Hello, playground"


// structs - value types
struct Resolution {
    var width = 0
    var height = 0
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("hd's width is: \(hd.width)")
print("cinema's width is: \(cinema.width)")
print("")

// the same behavior applies to enums

//classes = reference types
class VideMode {
    var resolution = Resolution()
    var interlaced = false
    var framRate = 0.0
    var name:String?
}
let tennn = VideMode()
tennn.resolution = hd
tennn.interlaced = true
tennn.name = "Stranger Things"
tennn.framRate = 25.0

let alsoTennn = tennn
alsoTennn.framRate = 30.0

print("tennn's frame rate: \(tennn.framRate)")
print("alsoTennn's frame rate: \(alsoTennn.framRate)")
print("")

// lazy properties

class Contract {
    var contract = "no contract"
}

class Footballer {
    var name: String?
    lazy var contractWith = Contract()
}

var footballer = Footballer()
footballer.name = "Jadon Sancho"
print(footballer.contractWith.contract)
footballer.contractWith.contract = "Chelsea FC"
print(footballer.contractWith.contract)
print("")

// computed properties - getters and setters
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var height = 0.0, width = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}
var square = Rect(origin: Point(x:0.0, y:0.0), size: Size(height:10.0, width:10.0))
//getter
var currentCenter = square.center
print(currentCenter)
//setter
square.center = Point(x: 15.0, y: 15.0)
var newCenter = square.center
print(newCenter)
print("")

// Property wrapper
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}
var zeroRectangle = ZeroRectangle()
print("ZeroRectangle's width: \(zeroRectangle.width) and height: \(zeroRectangle.height)")

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 4, maximum: 2) var height: Int
    @SmallNumber(wrappedValue: 2, maximum: 20) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
narrowRectangle.height = 150
narrowRectangle.width = 160
print(narrowRectangle.height, narrowRectangle.width)
print("")

// methods
class Number {
    var count = 0
    func increment() {
        count+=1
    }
    func increment(byAmount:Int) {
        count+=byAmount
    }
    func reset() {
        count = 0
    }
}

struct Pointss {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var po = Pointss()
po.moveBy(deltaX: 2, deltaY: 2)
print(po.x, po.y)

