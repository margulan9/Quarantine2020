import UIKit

var str = "Hello, playground"

// initializers

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let temp = Celsius(fromKelvin: 285)
let temp2 = Celsius(fromFahrenheit: 78)
print(temp, temp2)
print()

// designated and convinience initializations
class Food {
    var name: String
    init(name:String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "Unnamed")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let uknownProduct = RecipeIngredient()
let oneCheese = RecipeIngredient(name: "Cheese")
let manyCookies = RecipeIngredient(name: "Cookies", quantity: 22)

class ShopingList: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) - \(name)"
        output += purchased ? " purchased" : " not purchased"
        return output
    }
}

var breakfastList: [ShopingList] = [ShopingList(), ShopingList(name: "Cheese"), ShopingList(name: "Cookies", quantity: 22)]
breakfastList[2].purchased = true
for item in breakfastList {
    print(item.description)
}
