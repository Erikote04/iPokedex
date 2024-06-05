import SwiftUI

extension Pokemon.PokemonType: Identifiable {
    var id: String {
        self.type.name
    }
}

struct PokemonDataView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            HStack {
                Text("Type:")
                Spacer()
                ForEach(pokemon.types) { type in
                    Text(type.type.name.capitalized).bold()
                }
            }.padding(.horizontal)
            
            CustomDivider(height: 1)
            
            HStack {
                Text("Weight:")
                Spacer()
                Text("\(pokemon.weight)kg").bold()
            }.padding(.horizontal)
            
            CustomDivider(height: 1)
        }.padding()
    }
}

#Preview {
    PokemonDataView(
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
