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
