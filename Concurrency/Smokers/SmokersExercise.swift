import SwiftUI

class SmokerExercise {
    func run() {
        let table = Table()
        let agent = Agent(table: table)
        let smokers = [
            Smoker(id: 1, ingredient: .tobacco, table: table),
            Smoker(id: 2, ingredient: .paper, table: table),
            Smoker(id: 3, ingredient: .matches, table: table)
        ]

        Task {
            await agent.restoreIngredients()
        }

        Task {
            await withTaskGroup(of: Void.self) { taskGroup in
                for smoker in smokers {
                    taskGroup.addTask {
                        await smoker.smoke()
                    }
                }
            }
        }
    }
}
