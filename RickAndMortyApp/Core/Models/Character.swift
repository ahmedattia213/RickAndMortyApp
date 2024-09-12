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
