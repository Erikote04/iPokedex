import SwiftUI

struct PokemonGridView: View {
    let pokemons: [Pokemon]!
    
    let columns = [
        GridItem(.adaptive(minimum: 150)),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pokemons) { pokemon in
                        NavigationLink {
                            PokemonDetailsView(pokemon: pokemon)
                        } label: {
                            PokemonGridItemView(pokemon: pokemon)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
}
