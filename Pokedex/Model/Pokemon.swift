import SwiftUI

struct Pokemon: Identifiable, Decodable, Hashable {
    struct Sprite: Decodable, Hashable {
        struct Other: Decodable, Hashable {
            struct Artwork: Decodable, Hashable {
                let frontDefault: String
                
                enum CodingKeys: String, CodingKey {
                    case frontDefault = "front_default"
                }
            }
            
            let officialArtwork: Artwork
            
            enum CodingKeys: String, CodingKey {
                case officialArtwork = "official-artwork"
            }
        }
        let other: Other
    }
    
    struct PokemonType: Decodable, Hashable {
        struct InnerPokemonType: Decodable, Hashable {
            let name: String
            let url: String
        }
        
        let type: InnerPokemonType
    }
    
    let id: Int
    let name: String
    let weight: Double
    let height: Double
    let experience: Int
    let sprites: Sprite
    let types: [PokemonType]
    
    var url: URL? {
        URL(string: sprites.other.officialArtwork.frontDefault)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case weight
        case height
        case experience = "base_experience"
        case sprites
        case types
    }
    
    enum Types: String {
        case air
        case bug
        case dark
        case dragon
        case electric
        case fairy
        case fighting
        case fire
        case ghost
        case grass
        case ground
        case ice
        case normal
        case poison
        case psychic
        case rock
        case water
    }
    
    var color: Color {
        let pokemonType = types[0].type.name
        switch Types(rawValue: pokemonType) {
        case .air, .ice, .water:
            return Color.cyan
        case .bug, .grass:
            return Color.green
        case .dark:
            return Color.black
        case .electric:
            return Color.yellow
        case .fairy, .normal, .psychic:
            return Color.pink
        case .dragon, .fire:
            return Color.red
        case .ghost, .poison:
            return Color.purple
        case .fighting, .ground, .rock:
            return Color.brown
        default:
            return Color.gray
        }
    }
}
