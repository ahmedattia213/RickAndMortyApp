import Combine
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var selectedStatus: String? = nil
    
    private let characterService: CharacterService

    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    @MainActor
    func fetchCharacters(status: String? = nil) async {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            selectedStatus = status
            let characterResponse = try await characterService.fetchInitialCharacters(status: status)
            characters = characterResponse.results
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    @MainActor
    func fetchNextPage() async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            let characterResponse = try await characterService.fetchNextPage()
            characters.append(contentsOf: characterResponse.results)
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    @MainActor
    func applyFilter(status: String? = nil) async {
        selectedStatus = status
        characterService.resetPagination()
        await fetchCharacters(status: status)
    }
}
