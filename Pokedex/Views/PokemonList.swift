import SwiftUI

struct PokemonList: View {
    let pokemons = getPokemons()
    
    var body: some View {
        List(pokemons) { pokemon in
            PokemonItem(pokemon: pokemon)
        }
    }
}

// Shows one pokemon
struct PokemonItem: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
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
        }
        .background(pokemon.color)
    }
}

#Preview {
    PokemonList()
}
