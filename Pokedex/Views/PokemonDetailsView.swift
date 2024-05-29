import SwiftUI

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(pokemon.name.capitalized)
                .font(.largeTitle)
            
            pokemon.asyncImage()
            
            Spacer()
        }
        .padding()
        .background(pokemon.color)
    }
}

#Preview {
    PokemonDetailsView(
        pokemon:
            Pokemon(
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
            )
    )
}
