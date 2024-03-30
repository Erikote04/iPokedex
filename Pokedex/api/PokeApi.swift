import SwiftUI

func getPokemons() -> [Pokemon] {
    let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
    let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")
    let squitleURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")

    let pokemons = [
        Pokemon(name: "Bulbasaur", url: bulbasaurURL, color: Color.green),
        Pokemon(name: "Charmander", url: charmanderURL, color: Color.orange),
        Pokemon(name: "Squitle", url: squitleURL, color: Color.cyan),
    ]
    
    return pokemons
}
