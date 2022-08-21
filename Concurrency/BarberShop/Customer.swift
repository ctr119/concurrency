import Foundation

struct Customer {
    let name: String
    let shop: BarberShop
    
    func enterTheBarberShop() async {
        log(message: "ENTERS the shop")
        let isWaiting = await shop.takeASit()
        
        while(isWaiting) {
            
        }
        
        await shop.releaseASit()
        log(message: "LEAVES the shop")
    }
    
    private func log(message: String) {
        print("[\(name)] \(message)")
    }
}
