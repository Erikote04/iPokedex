import SwiftUI

class CapturedPokemonManager: ObservableObject {
    @Published var capturedPokemons: Set<Pokemon> = []
    
    func capturePokemon(_ pokemon: Pokemon) {
        capturedPokemons.insert(pokemon)
    }
    
    var sortedPokemons: [Pokemon] {
        capturedPokemons.sorted { $0.id < $1.id }
    }
}

struct PokedexView: View {
    @EnvironmentObject var capturedPokemonManager: CapturedPokemonManager
    
    var body: some View {
        VStack {
            if capturedPokemonManager.sortedPokemons.isEmpty {
                Text("You don't have any pokemons yet")
            } else {
                TabView {
                    ForEach(capturedPokemonManager.sortedPokemons) { pokemon in
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
