import Foundation

/// Dependency Injection container providing shared instances.
class DIContainer {
    let characterService: CharacterService
    let router: AppRouter
    
    /// Lazy property for the main coordinator.
    lazy var mainCoordinator: MainCoordinator = MainCoordinator(with: router)
    
    /// Initializes the DI container with the necessary dependencies.
    /// - Parameters:
    ///   - characterService: The service responsible for fetching characters data.
    ///   - router: The router responsible for managing navigation.
    init(
        characterService: CharacterService,
        router: AppRouter
    ) {
        self.characterService = characterService
        self.router = router
    }
}

extension DIContainer {
    /// Provides a default DI container with initialized dependencies.
    /// - Returns: A `DIContainer` instance with default services.
    static func defaultContainer() -> DIContainer {
        let characterService = CharacterService()
        let router = AppRouter()
        
        return DIContainer(
            characterService: characterService,
            router: router
        )
    }
}
