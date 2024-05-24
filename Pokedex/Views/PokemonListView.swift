import SwiftUI

struct PokemonListView: View {
    let pokemons: [Pokemon]!
    @State private var searchText = ""
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons.sorted { $0.id < $1.id }
    }
    
    var searchResults: [Pokemon] {
        if searchText.isEmpty {
            pokemons
        } else {
            pokemons.filter { pokemon in
                pokemon.name.contains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                    PokemonListCellView(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokepedia")
            
            Button("Load more...") {
                // use pagination to load more pokemons
            }
            .padding()
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    PokemonListView(
        pokemons:
            [Pokemon(
                id: 35,
                name: "clefairy",
                weight: 75,
                sprites: Pokemon.Sprite(
                    other: Pokemon.Sprite.Other(
                        officialArtwork: Pokemon.Sprite.Other.Artwork(
                            frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png"
                        )
                    )
                ),
                types: [
                    Pokemon.PokemonType(
                        type: Pokemon.PokemonType.InnerPokemonType(
                            name: "fairy",
                            url: "https://pokeapi.co/api/v2/type/18/"
                        )
                    )
                ]
            )]
    )
}
