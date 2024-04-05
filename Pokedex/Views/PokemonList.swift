import SwiftUI

struct PokemonList: View {
    let pokemons: [Pokemon]!
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetails(pokemon: pokemon)) {
                    PokemonItem(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokemonList(pokemons: [])
}
