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
            printSeats(extraMessage: "New Customer has arrived: \(customer)")
            return true
        }
        
        return false
    }
    
    func releaseASit(_ customer: Customer) {
        if let index = seats.firstIndex(where: { $0 == customer }) {
            printSeats(extraMessage: "\(customer) leaves")
            seats.remove(at: index)
        }
    }
    
    private func printSeats(extraMessage: String) {
        let prefix = "[Shop]"
        
        print("\(prefix) \(extraMessage)")
        print("\(prefix) - \(seats) -")
    }
    
    func areThereMoreCustomers() -> Bool {
        seats.count > 0
    }
}
