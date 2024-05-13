import SwiftUI

struct PokemonDetails: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(pokemon.name.capitalized)
                .font(.largeTitle)
            
            AsyncImage(url: pokemon.url) { pokemonImage in
                pokemonImage
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                VStack(spacing: 10) {
                    ProgressView()
                    Text("Pokeloading...")
                }
            }
            
            Spacer()
        }
        .padding()
        .background(pokemon.color)
    }
}

#Preview {
    PokemonDetails(pokemon: Pokemon(id: 35,
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
                                    ))
}
