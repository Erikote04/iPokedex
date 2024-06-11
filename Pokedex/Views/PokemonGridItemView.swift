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
