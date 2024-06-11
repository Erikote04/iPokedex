import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]
    @EnvironmentObject var capturedPokemonManager: CapturedPokemonManager

    var body: some View {
        TabView {
            PokedexView()
                .badge(capturedPokemonManager.capturedPokemons.count)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokedex")
                }
            PokepediaView(pokemons: pokemons)
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Pokepedia")
                }
            PokemonMapView(pokemons: pokemons)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
        }
        .font(.headline)
        .task {
            let pokemons = await PokeAPI().getPokemons()
            self.pokemons = pokemons.sorted { $0.id < $1.id }
        }
    }
}
