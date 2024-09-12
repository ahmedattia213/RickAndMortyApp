import Foundation

typealias MainCoordinator = GenericCoordinator<AppDestination>

/// Enum representing the different destinations in the app.
enum AppDestination: Hashable {
    case home
    case detail(Character)
    
    // Implementing Hashable protocol
    static func == (lhs: AppDestination, rhs: AppDestination) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home):
            return true
        case (.detail(let lhsCharacter), .detail(let rhsCharacter)):
            return lhsCharacter == rhsCharacter
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine("home")
        case .detail(let character):
            hasher.combine(character)
        }
    }
}
