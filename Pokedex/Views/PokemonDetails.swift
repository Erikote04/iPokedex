import SwiftUI

struct PokemonDetails: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(pokemon.name)
                .font(.largeTitle)
            
            AsyncImage(url: pokemon.url) { pokemonImage in
                pokemonImage
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                VStack(spacing: 10) {
                    ProgressView()
                    Text("Pokeloading...")
                }
            }
            
            Spacer()
        }
        .background(pokemon.color)
    }
}

//#Preview {
// PokemonDetails(pokemon: Pokemon(id: 1, name: "Bulbasaur"))
// url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
// color: Color.green))
//}
