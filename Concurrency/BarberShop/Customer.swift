import Foundation

struct Customer {
    let name: String
    let shop: BarberShop
    let barber: Barber
    
    func enterTheBarberShop() async {
        log(message: "ENTERS the shop")
        let isWaiting = await shop.takeASit(self)
        
        while(isWaiting) {
            
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
