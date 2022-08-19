import Foundation

struct Smoker {
    let id: Int
    let ingredient: Ingredient
    let table: Table
    
    func smoke() async {
        log(message: "Waiting for ingredients...")
        
        while(true) {
            if await table.areThereEnoughIngredients(smokerIngredient: ingredient) {
                
                log(message: "Takes ingredients")
                await table.removeIngredients()
                
                let secs = UInt64.random(in: 1..<6)
                log(message: "Starts to smoke! (\(secs)s)")
                try? await Task.sleep(nanoseconds: secs * 1_000_000_000)
                log(message: "Stops smoking")
                
                await table.freeSmokingArea()
            }
        }
    }
    
    private func log(message: String) {
        print("[Smoker \(id)] (\(ingredient.toString())) \(message)")
    }
}
