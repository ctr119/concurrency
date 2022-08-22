import Foundation
import SwiftUI

class BarberShopExercise {
    func run() {
        let shop = BarberShop()
        let barber = Barber(barberShop: shop)
        let customers = [
            Customer(name: "Bilbo", shop: shop, barber: barber),
            Customer(name: "Frodo", shop: shop, barber: barber),
            Customer(name: "Sam", shop: shop, barber: barber),
            Customer(name: "Merry", shop: shop, barber: barber),
            Customer(name: "Pipin", shop: shop, barber: barber),
            Customer(name: "Smeagle", shop: shop, barber: barber)
        ]
        
        Task {
            await withTaskGroup(of: Void.self, body: { taskGroup in
                for customer in customers {
                    taskGroup.addTask {
                        await customer.enterTheBarberShop()
                    }
                }
            })
        }
    }
}
