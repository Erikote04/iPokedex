import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]

    var body: some View {
        TabView {
            PokemonMapView(pokemons: pokemons)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
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
        }
        .font(.headline)
    }
}

#Preview {
    PokemonTabView(pokemons: [])
}
