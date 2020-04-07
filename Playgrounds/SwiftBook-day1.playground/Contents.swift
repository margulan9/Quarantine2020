import UIKit

var str = "Hello, playground"
let fl:Float = 4
let d = "as"
let ss = 2
let quot = """
asdasd
asdasd
asd
"""
// array
var shopingList = ["kartoshka", "arbuz", "itd"]
shopingList[1] = "bottle of arbuz"
shopingList
//dictionart
var dict = [
    "Chelsea":"Champions",
    "MU":"Loosers"
]
dict["Chelsea"]
dict["Liverpool"] = "not bad team"
dict

//empty array or dictionary
var array = [Int]()
var dictionary = [Int:String]()

array = []
dictionary = [:]

//optional
var optionalName: String? = "Margulan"
var firstname: String? = nil
var surname: String = "Sugirbay"
//optioanl binding
if let name = optionalName {
    print(name)
} else {
    print("you dont have a name")
}
// using ?? operator
print("Hi \(firstname ?? surname)")


//tuples
let http404Error = (404, "Not found")

let (statusCode, statusMessage) = http404Error
print(statusCode)
print(statusMessage)
// to ignore other content
let (onlyStatusCode, _) = http404Error
print(onlyStatusCode)
// alternative way to access values of tuple
print(http404Error.1)
//
let http202Status = (statusCode: 200, statusMessage: "OK")
print(http202Status.statusMessage)

// assertions
var age = 0
assert(age >= 0, "A persons age can't be less than zero")
var p: String? = " k"
let pa = "namea"
var aa = p ?? pa
print(aa)
