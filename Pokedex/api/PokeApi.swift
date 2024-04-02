import SwiftUI

func getPokemons(completion: ([Pokemon]) -> Void) {
    let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
    let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")
    let squitleURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")
    
    getPokemon("https://pokeapi.co/api/v2/pokemon/80", completion: { pokemon in
            completion([ pokemon! ])
    })
}

func getPokemon(_ pokemonURL: String, completion: (Pokemon?) -> Void) {
    let data = Data(pokemon1JSON.utf8)
    
    parsePokemonJSON(data) { pokemon in
        completion(pokemon)
    }
}

func parsePokemonJSON(_ data: Data, completion: (Pokemon?) -> Void) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    completion(pokemon)
}
