import Foundation

actor BarberShop {
    private let numberOfSeats = 5
    private var seats: [Customer] = []
    
    func takeASit(_ customer: Customer) -> Bool {
        if seats.count < numberOfSeats {
            seats.append(customer)
            return true
        }
        return false
    }
    
    func releaseASit(_ customer: Customer) {
        if let index = seats.firstIndex(where: { $0 == customer }) {
            seats.remove(at: index)
        }
    }
}
