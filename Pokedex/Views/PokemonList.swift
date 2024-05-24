import SwiftUI

struct PokemonList: View {
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
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetails(pokemon: pokemon)) {
                    PokemonListCell(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokepedia")
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    PokemonList(pokemons: [Pokemon(id: 35,
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
                                  )])
}
