import SwiftUI

struct PokemonList: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetails(pokemon: pokemon)) {
                    PokemonItem(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokedex")
        }
        .onAppear {
            getPokemons { pokemons in
                self.pokemons = pokemons
            }
        }
    }
}

#Preview {
    PokemonList()
}
