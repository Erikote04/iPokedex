import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]

    var body: some View {
        TabView {
            PokemonView()
            //.badge(getPokemons().count)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokemon")
                }
            PokemonList(pokemons: pokemons)
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("Pokedex")
                }
        }
        .font(.headline)
    }
}

#Preview {
    PokemonTabView(pokemons: [])
}
