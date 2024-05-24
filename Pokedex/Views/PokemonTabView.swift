import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]

    var body: some View {
        TabView {
            PokedexView()
            //.badge(getPokemons().count)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokedex")
                }
            PokemonListView(pokemons: pokemons)
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
    }
}

#Preview {
    PokemonTabView(pokemons: [])
}
