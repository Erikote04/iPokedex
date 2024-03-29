import SwiftUI

struct PokemonView: View {
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            AsyncImage(url: pokemons[index].url) { pokemonImage in
                pokemonImage
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                VStack(spacing: 10) {
                    ProgressView()
                    Text("Pokeloading...")
                }
            }

            HStack {
                PokemonButton(title: "Previous") {
                    if index > 0 {
                        index -= 1
                    } else {
                        index = pokemons.count - 1
                    }
                }
                
                PokemonButton(title: "Next") {
                    if index < pokemons.count - 1 {
                        index += 1
                    } else {
                        index = 0
                    }
                }
            }
            
            Spacer()
        }.background(pokemons[index].color)
    }
}

#Preview {
    PokemonView()
}
