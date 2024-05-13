import SwiftUI

struct PokemonItem: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: pokemon.url) { pokemonImage in
                pokemonImage
                    .resizable()
                    .scaledToFill()
                    .background(pokemon.color)
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
            } placeholder: {
                Image(systemName: "person")
            }
            
            Text(pokemon.name.capitalized)
                .padding()
        }
    }
}

#Preview {
    PokemonItem(pokemon: Pokemon(id: 35,
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
