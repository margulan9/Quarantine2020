import UIKit

var str = "Hello, playground"

let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    //print(tickMark)
}

// switches
let somePoint = (0,3)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (0,_):
    print("\(somePoint) is on y axis")
case (_,0):
    print("\(somePoint) is on x axis")
case (-2...2, -2...2):
    print("\(somePoint) is somewhere in box")
default:
    print("\(somePoint) is outside the box")
}

let anotherPoint = (4,3)
switch anotherPoint {
case let (x,y) where x==y:
    print("\(x) and \(y) are equal")
case let (x,y):
    print("\(x) and \(y) are not equal")
}

// in-out parameters in function
func inOutExample(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt1 = 22
var someInt2 = 44
inOutExample(&someInt1, &someInt2)
print("\(someInt1) and \(someInt2) has changed")

// function type as a return
func returnMinus(_ number:Int) -> Int {
    return number * -1
}
func returnPlus(_ number:Int) -> Int{
    return number
}
func funcAsReturn(_ choose:Bool) -> (Int)->Int {
    return choose ? returnMinus:returnPlus
}
var currentValue = 3
let moveToZero = funcAsReturn(currentValue>0)

while currentValue > 0 {
    print("\(currentValue) is not negative")
    currentValue = moveToZero(currentValue)
}
print(currentValue)

// enums
enum Beverage: CaseIterable {
    case a, b, c, d
}

let numberOfChoices = Beverage.allCases.count
let dataInBeverage = Beverage.allCases
print(numberOfChoices)
print(dataInBeverage)

