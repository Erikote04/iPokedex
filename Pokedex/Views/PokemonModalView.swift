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
