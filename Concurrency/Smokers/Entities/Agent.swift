import Foundation

struct Agent {
    let table: Table
    
    func restoreIngredients() async {
        print("[Agent] Starts")
        
        while(true) {
            if await table.isAvailableToRestoreMoreIngedients() {
                guard let firstIngredient = getRandomIngredient(),
                      let secondIngredient = getRandomIngredient(excluding: firstIngredient) else { return }
                
                print("[Agent] Puts ingredients: \(firstIngredient.toString()) & \(secondIngredient.toString())")
                await table.putIngredients(firstIngredient, secondIngredient)
            }
        }
    }
    
    private func getRandomIngredient(excluding excludedIngredient: Ingredient? = nil) -> Ingredient? {
        let index = Int.random(in: 0..<3)
        var newIngredient = Ingredient(rawValue: index)
        
        while(newIngredient == excludedIngredient) {
            let newIndex = Int.random(in: 0..<3)
            newIngredient = Ingredient(rawValue: newIndex)
        }
        
        return newIngredient
    }
}
