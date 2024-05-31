import SwiftUI

class PokeApi {
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    let currentPage = APIPage()
    var pokemons: [Pokemon] = []
    
    func getPokemons() async -> [Pokemon] {
        for id in currentPage.start...currentPage.stop {
            if let pokemon = await getPokemon("\(baseURL)\(id)") {
                self.pokemons.append(pokemon)
            }
        }
        
        return self.pokemons
    }
}

/// Returns a Pokemon from PokeAPI
/// - Parameters:
///    - pokemonURL: to pokemon
/// Example
/// ```
/// getPokemon("https://pokeapi.co/api/v2/pokemon/80", completion: { pokemon in
///     completion([ pokemon! ])
/// })
/// ```
func getPokemon(_ pokemonURL: String, session: URLSession = URLSession.shared) async -> Pokemon? {
    guard let URL = URL(string: pokemonURL) else { return nil }
    
    let (data, response) = try! await session.data(from: URL)
    let pokemon = await parsePokemonJSON(data)
    
    return pokemon
}

func parsePokemonJSON(_ data: Data) async -> Pokemon? {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    return pokemon
}

