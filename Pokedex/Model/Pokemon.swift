import SwiftUI

struct Pokemon {
    let url: URL?
    let color: Color?
}

let bulbasaurURL = URL(string:
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")

let charmanderURL = URL(string:
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")

let squitleURL = URL(string:
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")

let pokemons = [
    Pokemon(url: bulbasaurURL, color: Color.green),
    Pokemon(url: charmanderURL, color: Color.orange),
    Pokemon(url: squitleURL, color: Color.cyan),
]

