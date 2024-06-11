import SwiftUI

struct PokepediaView: View {
    let pokemons: [Pokemon]!
    @State private var isShowingGrid = true
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons.sorted { $0.id < $1.id }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if isShowingGrid {
                    PokemonGridView(pokemons: pokemons)
                } else {
                    PokemonListView(pokemons: pokemons)
                }
            }
            .navigationTitle("Pokepedia")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingGrid.toggle()
                    }) {
                        Label("Change Layout", systemImage: isShowingGrid ? "list.bullet" : "square.grid.2x2")
                    }
                }
            }
        }
    }
}
