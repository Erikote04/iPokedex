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
    
    let id: Int
    let name: String
    let weight: Int
    let sprites: Sprite
    
    var url: URL? {
        nil
    }
    
    var color: Color? {
        Color.green
    }
}
