import SwiftUI

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                
                pokemon.asyncImage()
                
                PokemonDataView(pokemon: pokemon)
            }
            .padding()
        }
        .navigationTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .background(pokemon.color)
        .padding(.vertical)
    }
}

#Preview {
    let pokemonDetailView = PokemonDetailsView(
        pokemon:
            Pokemon(
                id: 35,
                name: "clefairy",
                weight: 75,
                height: 2,
                experience: 150,
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
            )
    )
    
    return NavigationStack {
        TabView {
            pokemonDetailView
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokedex")
                }
        }.navigationTitle(.constant("Pokemon")).navigationBarTitleDisplayMode(.inline)
    }
}
