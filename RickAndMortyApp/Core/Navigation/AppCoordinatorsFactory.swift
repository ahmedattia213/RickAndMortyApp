import Foundation

/// Factory for creating and managing coordinators within the app.
final class AppCoordinatorsFactory {
    let mainCoordinator: MainCoordinator

    /// Initializes the factory with a dependency injection container.
    /// - Parameter container: The DI container providing dependencies.
    init(container: DIContainer) {
        self.mainCoordinator = MainCoordinator(with: container.router)
    }
}
