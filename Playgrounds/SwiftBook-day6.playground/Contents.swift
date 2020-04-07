import UIKit

var str = "Hello, playground"


protocol FullyNamed {
    var fullName: String { get }
    mutating func changeName() -> String
}

struct Name: FullyNamed {
    
    var fullName: String
    mutating func changeName() -> String {
        fullName = "Marshal Ted"
        return fullName
    }
    
}

var person1 = Name(fullName: "John Doe")
print(person1.fullName)
person1.changeName()
print(person1.fullName)
