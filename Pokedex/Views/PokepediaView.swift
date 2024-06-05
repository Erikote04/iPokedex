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

#Preview {
    PokepediaView(
        pokemons: [
            Pokemon(
                id: 35,
                name: "clefairy",
                weight: 75,
                sprites: Pokemon.Sprite(
                    other: Pokemon.Sprite.Other(
                        officialArtwork: Pokemon.Sprite.Other.Artwork(
                            frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png"
                        )
                    )
                ),
                types: [
                    Pokemon.PokemonType(
                        type: Pokemon.PokemonType.InnerPokemonType(
                            name: "fairy",
                            url: "https://pokeapi.co/api/v2/type/18/"
                        )
                    )
                ]
            )
        ]
    )
}
