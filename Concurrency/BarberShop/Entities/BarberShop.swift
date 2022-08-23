import Foundation

actor BarberShop {
    private let numberOfSeats = 5
    private var seats: [Customer] = []
    
    func takeASit(_ customer: Customer) -> Bool {
        if seats.contains(customer) {
            return true
        }
        
        if seats.count < numberOfSeats {
            seats.append(customer)
            printSeats(extraMessage: "New Customer takes a sit: \(customer)")
            return true
        }
        
        return false
    }
    
    func releaseASit(_ customer: Customer) {
        if let index = seats.firstIndex(where: { $0 == customer }) {
            seats.remove(at: index)
            printSeats(extraMessage: "\(customer) releases a sit")
        }
    }
    
    private func printSeats(extraMessage: String) {
        let prefix = "[Shop]"
        
        print("\(prefix) \(extraMessage)\n\tSeats: \(seats)")
    }
    
    func getNextCustomer() -> Customer? {
        seats.count > 0 ? seats[0] : nil
    }
}
