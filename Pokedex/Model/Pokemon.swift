import SwiftUI

struct Pokemon: Identifiable, Decodable {
    struct Sprite: Decodable {
        struct Other: Decodable {
            struct Artwork: Decodable {
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
    
    struct PokemonType: Decodable {
        struct InnerPokemonType: Decodable {
            let name: String
            let url: String
        }
        
        let type: InnerPokemonType
    }
    
    let id: Int
    let name: String
    let weight: Int
    let sprites: Sprite
    let types: [PokemonType]
    
    var url: URL? {
        URL(string: sprites.other.officialArtwork.frontDefault)
    }
    
    var color: Color? {
        if types[0].type.name == "Earth" {
            return Color.brown
        } else if types[0].type.name == "Fire" {
            return Color.red
        } else if types[0].type.name == "Water" {
            return Color.blue
        }
        
        return Color.gray
    }
}
