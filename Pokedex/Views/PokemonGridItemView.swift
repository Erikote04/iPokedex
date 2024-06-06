import SwiftUI

struct PokemonGridItemView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            pokemon.asyncImage()
                .frame(width: 100, height: 100)
            
            VStack {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                //                Text(pokemon.type)
                //                    .font(.caption)
                //                    .foregroundStyle(.gray)
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(pokemon.color)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black)
        )
    }
}

#Preview {
    PokemonGridItemView(
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
}
