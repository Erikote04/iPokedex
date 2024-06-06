import SwiftUI

struct PokemonListCellView: View {
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
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(pokemon.color)
            }
            
            Text(pokemon.name.capitalized).bold()
                .padding(.horizontal, 5)
        }
    }
}

#Preview {
    PokemonListCellView(
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
