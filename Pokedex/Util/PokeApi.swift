import SwiftUI

class PokeApi {
    static let shared: PokeApi = PokeApi()
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    var currentPage = APIPage()
    var pokemons: [Pokemon] = []
    
    func getPokemons() async -> [Pokemon] {
        self.pokemons = []
        
        for id in currentPage.start...currentPage.stop {
            if let pokemon = await getPokemon("\(baseURL)\(id)") {
                self.pokemons.append(pokemon)
            }
        }
        
        return self.pokemons
    }
}

func getPokemon(_ pokemonURL: String, session: URLSession = URLSession.shared) async -> Pokemon? {
    guard let url = URL(string: pokemonURL) else { return nil }
    
    do {
        let (data, response) = try await session.data(from: url)
        if let HTTPResponse = response as? HTTPURLResponse,
           HTTPResponse.statusCode == 404 {
            print("Invalid ID: \(url)")
            return nil
        } else {
            let pokemon = await parsePokemonJSON(data)
            return pokemon
        }
    } catch {
        print("Failed to fetch data: \(error.localizedDescription)")
        return nil
    }
}

func parsePokemonJSON(_ data: Data) async -> Pokemon? {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    return pokemon
}
