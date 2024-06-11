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
