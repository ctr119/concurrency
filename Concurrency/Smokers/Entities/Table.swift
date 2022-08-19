import Foundation

actor Table {
    private var isSmokingAreaFree = true
    private var ingredients: [Ingredient] = []
    
    func areThereEnoughIngredients(smokerIngredient: Ingredient) -> Bool {
        ingredients.count == 2
        && (
            ingredients.filter { $0 == .tobacco }.count == 1
            || ingredients.filter { $0 == .paper }.count == 1
            || ingredients.filter { $0 == .matches }.count == 1
        )
        && !ingredients.contains(smokerIngredient)
        && isSmokingAreaFree
    }
    
    func removeIngredients() {
        isSmokingAreaFree = false
        ingredients.removeAll()
    }
    
    func freeSmokingArea() {
        isSmokingAreaFree = true
    }
    
    func isAvailableToRestoreMoreIngedients() -> Bool {
        ingredients.isEmpty && isSmokingAreaFree
    }
    
    func putIngredients(_ a: Ingredient, _ b: Ingredient) {
        ingredients.append(contentsOf: [a, b])
    }
}
