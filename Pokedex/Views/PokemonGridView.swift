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

#Preview {
    PokemonGridView(
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
