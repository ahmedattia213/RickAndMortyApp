#if DEBUG
import Combine
struct PreviewContent {
    static let diContainer = DIContainer.defaultContainer()
    static let viewModelsFactory = AppViewModelFactory(container: diContainer)
    static let appCoordinatorsFactory = AppCoordinatorsFactory(container: diContainer)
    
    //MARK: View Models
    static let characterViewModel = viewModelsFactory.makeCharacterViewModel()
    static let coordinator = diContainer.mainCoordinator
    
    static let dummyCharacter1 = Character(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        gender: "Male",
        location: .init(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    )

    static let dummyCharacter2 = Character(
        id: 2,
        name: "Morty Smith",
        status: "Alive",
        species: "Human",
        gender: "Male",
        location: .init(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
    )

    static let dummyCharacter3 = Character(
        id: 3,
        name: "Summer Smith",
        status: "Alive",
        species: "Human",
        gender: "Female",
        location: .init(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
    )

    static let dummyCharacter4 = Character(
        id: 4,
        name: "Beth Smith",
        status: "Alive",
        species: "Human",
        gender: "Female",
        location: .init(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"
    )

    static let dummyCharacter5 = Character(
        id: 5,
        name: "Jerry Smith",
        status: "Alive",
        species: "Human",
        gender: "Male",
        location: .init(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"
    )
    
    static let dummyCharacter6 = Character(
        id: 6,
        name: "Mr. Meeseeks",
        status: "Unknown",
        species: "Meeseeks",
        gender: "Male",
        location: .init(name: "Earth", url: ""),
        image: "https://rickandmortyapi.com/api/character/avatar/242.jpeg"
    )
}
#endif
