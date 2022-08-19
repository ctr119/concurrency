import Foundation

enum Ingredient: Int {
    case tobacco = 0
    case paper = 1
    case matches = 2
    
    func toString() -> String {
        switch self {
        case .tobacco:
            return "tobacco"
        case .paper:
            return "paper"
        case .matches:
            return "matches"
        }
    }
}
