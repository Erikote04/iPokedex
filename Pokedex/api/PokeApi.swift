import SwiftUI

func getPokemons(completion: @escaping ([Pokemon]) -> Void) {
    var pokemons = [Pokemon]()
    
    for id in 1..<10 {
        getPokemon("https://pokeapi.co/api/v2/pokemon/\(id)", completion: { pokemon in
            if let pokemon = pokemon {
                pokemons.append(pokemon)
                completion(pokemons)
            }
        })
    }
}

/// Returns a Pokemon from PokeAPI
/// - Parameters:
///    - pokemonURL: to pokemon
///    - completion: this returns a Pokemon (if found and all is OK) in the Main Thread
/// Example
/// ```
/// getPokemon("https://pokeapi.co/api/v2/pokemon/80", completion: { pokemon in
///     completion([ pokemon! ])
/// })
/// ```
func getPokemon(_ pokemonURL: String, completion: @escaping (Pokemon?) -> Void) {
    guard let URL = URL(string: pokemonURL) else { return }
    
    let request = URLRequest(url: URL)
    let session = URLSession.shared
    let task = session.dataTask(with: request) { data, response, error in
        if error == nil,
           let statusCode = (response as? HTTPURLResponse)?.statusCode,
           let data = data {
            parsePokemonJSON(data) { pokemon in
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            }
        }
    }
    
    task.resume()
}

func parsePokemonJSON(_ data: Data, completion: (Pokemon?) -> Void) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    completion(pokemon)
}

