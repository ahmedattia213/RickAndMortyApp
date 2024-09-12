import XCTest
@testable import RickAndMortyApp

final class CharacterViewModelTests: XCTestCase {
    
    var viewModel: CharacterViewModel!
    var mockService: MockCharacterService!
    
    private let mockedCharactersResponse = CharacterResponse(info: CharacterResponse.Info(count: 2, pages: 1, next: nil, prev: nil), results: [
        Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
    ])
    
    override func setUp() {
        super.setUp()
        mockService = MockCharacterService(mockResponse: mockedCharactersResponse)
        viewModel = CharacterViewModel(characterService: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    // Existing Tests
    func testFetchCharactersSuccess() async {
        await viewModel.fetchCharacters()
        
        // Check if the characters array is updated
        XCTAssertEqual(viewModel.characters.count, mockedCharactersResponse.results.count)
        XCTAssertEqual(viewModel.characters.first?.name, mockedCharactersResponse.results.first?.name)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchCharactersError() async {
        // Setup mock service to return error
        mockService.shouldReturnError = true
        
        await viewModel.fetchCharacters()
        
        // Check if error message is updated
        XCTAssertEqual(viewModel.characters.count, 0)
        XCTAssertNotNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFetchNextPageSuccess() async {
        // Setup mock response for initial page
        let mockCharacters = [
            Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        ]
        
        mockService.mockResponse = CharacterResponse(info: CharacterResponse.Info(count: 1, pages: 1, next: "https://nextpageurl.com", prev: nil), results: mockCharacters)
        
        await viewModel.fetchCharacters()
        
        // Set next page mock response
        mockService.mockResponse = CharacterResponse(info: CharacterResponse.Info(count: 1, pages: 1, next: nil, prev: nil), results: [
            Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
        ])
        
        await viewModel.fetchNextPage()
        
        // Check if both pages are loaded
        XCTAssertEqual(viewModel.characters.count, 2)
        XCTAssertEqual(viewModel.characters[0].name, "Rick Sanchez")
        XCTAssertEqual(viewModel.characters[1].name, "Morty Smith")
    }
    
    func testApplyFilter() async {
        // Test applying a filter resets the data and fetches filtered characters
        let mockCharacter = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", location: CharacterLocation(name: "Earth", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        mockService.mockResponse = CharacterResponse(info: CharacterResponse.Info(count: 1, pages: 1, next: nil, prev: nil), results: [mockCharacter])
        
        await viewModel.applyFilter(status: "Alive")
        
        // Ensure the characters list is reset and only filtered characters appear
        XCTAssertEqual(viewModel.characters.count, 1)
        XCTAssertEqual(viewModel.characters.first?.status, "Alive")
    }
}

class MockCharacterService: CharacterService {
    var shouldReturnError = false
    var mockResponse: CharacterResponse
    var nextPageURL: URL? = URL(string: "https://nextpageurl.com")

    init(shouldReturnError: Bool = false, mockResponse: CharacterResponse) {
        self.shouldReturnError = shouldReturnError
        self.mockResponse = mockResponse
    }
    
    override func fetchInitialCharacters(status: String? = nil) async throws -> CharacterResponse {
        if shouldReturnError {
            throw CharacterServiceError.networkError(NSError(domain: "", code: 500, userInfo: nil))
        }
        return mockResponse
    }
    
    override func fetchNextPage() async throws -> CharacterResponse {
        if shouldReturnError || nextPageURL == nil {
            throw CharacterServiceError.invalidURL
        }
        return mockResponse
    }
}
