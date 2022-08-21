import Foundation

actor BarberShop {
    private let numberOfSeats = 5
    private var freeSeats = 5
    
    func takeASit() -> Bool {
        if freeSeats <= numberOfSeats && freeSeats > 0 {
            freeSeats -= 1
            return true
        }
        return false
    }
    
    func releaseASit() {
        if freeSeats < numberOfSeats {
            freeSeats += 1
        }
    }
}
