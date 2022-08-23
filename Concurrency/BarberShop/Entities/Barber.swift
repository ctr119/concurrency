import Foundation

actor Barber {
    enum Instruction {
        case wait
        case pass
    }
    
    private let barberShop: BarberShop
    
    init(barberShop: BarberShop) {
        self.barberShop = barberShop
    }
    
    func awake(by customer: Customer) async -> Instruction {
        guard let nextCustomer = await barberShop.getNextCustomer(),
              nextCustomer == customer else { return .wait }
        
        // Perform the haircut
        let secs = UInt64.random(in: 1..<5)
        print("[Barber] Haircut to \(customer). It'll take \(secs)s...")
        try? await Task.sleep(nanoseconds: secs * 1_000_000_000)
        print("[Barber] Done with \(customer)!")
        
        return .pass
    }
}
