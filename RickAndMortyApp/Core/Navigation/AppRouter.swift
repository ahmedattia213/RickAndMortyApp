import SwiftUI

/// Manages the navigation stack within the app.
final class AppRouter: ObservableObject {
    @Published var navPath = NavigationPath()

    /// Pushes a destination onto the navigation stack.
    /// - Parameter destination: The destination to push onto the stack.
    func push(to destination: any Hashable) {
        navPath.append(destination)
    }

    /// Pops a number of destinations from the navigation stack.
    /// - Parameter count: The number of destinations to pop.
    func pop(_ count: Int = 1) {
        guard navPath.count >= count else { return }
        navPath.removeLast(count)
    }

    /// Resets the navigation stack to its initial, empty state.
    func popToRoot() {
        navPath = NavigationPath()
    }
}
