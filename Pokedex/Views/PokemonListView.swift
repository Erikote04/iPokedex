import SwiftUI

struct PokemonListView: View {
    let pokemons: [Pokemon]!
    @State private var searchText = ""
    
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPokemons) { pokemon in
                NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                    PokemonListCellView(pokemon: pokemon)
                }
            }
            .searchable(
                text: $searchText,
                prompt: "Search"
            ) {
                if !searchText.isEmpty {
                    Text("TOP NAME MATCHES")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                ForEach(filteredPokemons) { pokemon in
                    NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                        Text(pokemon.name.capitalized)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
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
