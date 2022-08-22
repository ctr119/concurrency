import Foundation

struct Customer {
    let name: String
    let shop: BarberShop
    let barber: Barber
    
    func enterTheBarberShop() async {
        log(message: "ENTERS the shop")
        
        if await shop.takeASit(self) {
            await barber.awake(by: self)
        }
        
        await shop.releaseASit(self)
        log(message: "LEAVES the shop")
    }
    
    private func log(message: String) {
        print("[\(name)] \(message)")
    }
}

extension Customer: Equatable {
    static func == (lhs: Customer, rhs: Customer) -> Bool {
        lhs.name == rhs.name
    }
}

extension Customer: CustomStringConvertible {
    var description: String {
        name
    }
}
