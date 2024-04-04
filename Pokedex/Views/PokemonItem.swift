import SwiftUI

struct PokemonItem: View {
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
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
            
            Text(pokemon.name)
                .padding()
                .font(.largeTitle)
                .background(Color("BackgroundNameColor"))
                .foregroundColor(pokemon.color)
                .cornerRadius(8)
                .position(x: 100, y: 50)
        }
        .background(pokemon.color)
    }
}

// #Preview {
// PokemonItem(pokemon: Pokemon(id: 1, name: "Bulbasaur"))
// url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
// color: Color.green))
// }
