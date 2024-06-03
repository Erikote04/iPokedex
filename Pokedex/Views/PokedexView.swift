import SwiftUI

class CapturedPokemonManager: ObservableObject {
    @Published var capturedPokemons: [Pokemon] = []
    
    func capturePokemon(_ pokemon: Pokemon) {
        capturedPokemons.append(pokemon)
    }
}

struct PokedexView: View {
    @EnvironmentObject var capturedPokemonManager: CapturedPokemonManager
    
    var body: some View {
        VStack {
            if capturedPokemonManager.capturedPokemons.isEmpty {
                Text("You don't have any pokemons yet")
            } else {
                TabView {
                    ForEach(capturedPokemonManager.capturedPokemons) { pokemon in
                        PokemonDetailsView(pokemon: pokemon)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .ignoresSafeArea()
                
                Spacer()
            }
        }
    }
}

#Preview {
    PokedexView()
}
