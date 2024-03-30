import SwiftUI

func getPokemons() -> [Pokemon] {
    let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
    let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")
    let squitleURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")

    let pokemons = [
        Pokemon(id: 1, name: "Bulbasaur", url: bulbasaurURL, color: Color.green),
        Pokemon(id: 2, name: "Charmander", url: charmanderURL, color: Color.orange),
        Pokemon(id: 3, name: "Squitle", url: squitleURL, color: Color.cyan),
        Pokemon(id: 4, name: "Bulbasaur 2", url: bulbasaurURL, color: Color.brown),
        Pokemon(id: 5, name: "Charmander 2", url: charmanderURL, color: Color.red),
        Pokemon(id: 6, name: "Squitle 2", url: squitleURL, color: Color.blue),
    ]
    
    return pokemons
}
