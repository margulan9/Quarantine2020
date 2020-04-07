import UIKit

var str = "Hello, playground it is day 5"

// Error handling
// propagating errors using throwing functions

struct Item {
    var price: Int
    var count: Int
}

enum VendingMachineError: Error {
    case invalidSelesction
    case insafitientFunds(coinsNeeded: Int)
    case outOfStock
}

class VendingMachine {
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 12),
        "Chips" : Item(price: 21, count: 2),
        "Pretzels" : Item(price: 10, count: 22)
    ]
    
    
    var coinsDeposited = 0
    
    func vend(itemNamed name:String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelesction
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insafitientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}


let favoriteSnacks = [
    "Fav1": "Chips",
    "Fav2": "Candy Bar"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Pretzels"
    try vendingMachine.vend(itemNamed: snackName)
}
var vends = VendingMachine()
vends.coinsDeposited = 9
// this one calls 'propagating errors using throwing functions
// try buyFavoriteSnack(person: "Fav1", vendingMachine: vends)

// handling errors using do-catch
do {
    try buyFavoriteSnack(person: "Fav9", vendingMachine: vends)
    print("mm tasty")
} catch VendingMachineError.outOfStock {
    print("out of stock")
} catch VendingMachineError.invalidSelesction {
    print("invalid selection")
} catch VendingMachineError.insafitientFunds(let coinsNeeded) {
    print("coins needed \(coinsNeeded)")
} catch {
    print("unexpecteted error: \(error)")
}
print()
// extensions

extension Double {
    var km: Double { return self / 1000.0}
    var cm: Double { return self * 100.0}
    var dm: Double { return self * 10.0}
    var m: Double { return self }
}

var domoi = 21.km
var toCm = 22.cm
print(domoi, toCm)
