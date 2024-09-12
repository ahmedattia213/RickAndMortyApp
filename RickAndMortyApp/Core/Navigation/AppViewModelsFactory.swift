/// Factory class to create view models for the app.
/// It uses the dependency injection container to provide necessary services
class AppViewModelFactory {
    private let characterService: CharacterService
    private let characterViewModel: CharacterViewModel
    
    init(container: DIContainer) {
        self.characterService = container.characterService
        self.characterViewModel = CharacterViewModel(characterService: characterService)
    }

    // Async method to return the view model
    func makeCharacterViewModel() -> CharacterViewModel {
        characterViewModel
    }
}


