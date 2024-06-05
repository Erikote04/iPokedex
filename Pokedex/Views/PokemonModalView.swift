import SwiftUI

struct PokemonModalView: View {
    @EnvironmentObject var capturedPokemonManager: CapturedPokemonManager
    @Environment(\.dismiss) var dismiss
    let pokemon: Pokemon
    
    var isCaptured: Bool {
        capturedPokemonManager.capturedPokemons.contains(pokemon)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .bold()
                
                pokemon.asyncImage()
                
                Spacer()
                
                if isCaptured {
                    Text("You already have this pokemon")
                        .font(.caption)
                        .foregroundStyle(.red)
                }
                
                Button("Capture") {
                    capturedPokemonManager.capturePokemon(pokemon)
                    dismiss()
                }
                .disabled(isCaptured)
                .frame(width: 200)
                .padding()
                .background(isCaptured ? .gray : pokemon.color)
                .foregroundStyle(.white)
                .cornerRadius(8)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Escape") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    PokemonModalView(
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
