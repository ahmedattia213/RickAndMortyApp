import Combine
import Foundation

// Character Model
struct Character: Identifiable, Codable, Equatable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: CharacterLocation
    let image: String
}

struct CharacterLocation: Identifiable, Codable, Equatable, Hashable {
    var id: String { name + url }
    let name: String
    var url: String = ""
}

struct CharacterResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [Character]
}

// Custom Error Type for better error handling
enum CharacterServiceError: Error, LocalizedError {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL was invalid."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
}

import Combine
import Foundation

// Service for fetching Rick and Morty characters
class CharacterService {
    private let baseURL = "https://rickandmortyapi.com/api/character"
    private var nextPageURL: URL?

    init() {
        resetPagination()  // Sets initial pagination URL
    }

    func fetchInitialCharacters(status: String? = nil) async throws -> CharacterResponse {
        var urlString = baseURL
        if let status = status {
            urlString += "?status=\(status)"
        } else {
            urlString += "?page=1"
        }
        guard let url = URL(string: urlString) else {
            throw CharacterServiceError.invalidURL
        }
        return try await fetchCharacterResponse(from: url)
    }

    func fetchNextPage() async throws -> CharacterResponse {
        guard let url = nextPageURL else {
            throw CharacterServiceError.invalidURL
        }
        return try await fetchCharacterResponse(from: url)
    }

    private func fetchCharacterResponse(from url: URL) async throws -> CharacterResponse {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(CharacterResponse.self, from: data)
            nextPageURL = response.info.next.flatMap(URL.init)
            return response
        } catch let error as DecodingError {
            throw CharacterServiceError.decodingError(error)
        } catch {
            throw CharacterServiceError.networkError(error)
        }
    }

    func resetPagination() {
        nextPageURL = URL(string: baseURL + "?page=1")  // Reset to the first page
    }
}

