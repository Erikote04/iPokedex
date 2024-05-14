import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]

    var body: some View {
        TabView {
            PokemonView()
            //.badge(getPokemons().count)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokedex")
                }
            PokemonList(pokemons: pokemons)
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
