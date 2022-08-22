import Foundation

actor Barber {
    private let barberShop: BarberShop
        
    private var sleepingTimer: Timer?
    
    init(barberShop: BarberShop) {
        self.barberShop = barberShop
    }
    
    func sleep() {
        sleepingTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            print("[Barber] Zzz...")
        })
    }
    
    func awake(by customer: Customer) async {
        if let _ = sleepingTimer?.isValid {
            sleepingTimer?.invalidate()
        }
        
        // Perform the haircut
        let secs = UInt64.random(in: 1..<5)
        try? await Task.sleep(nanoseconds: secs * 1_000_000_000)
        
        if await !barberShop.areThereMoreCustomers() {
            sleep()
        }
    }
}
