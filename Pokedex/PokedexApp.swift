import SwiftUI

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PokemonView()
                    .badge(getPokemons().count)
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Pokemon")
                    }
                PokemonList()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.fill")
                        Text("Pokedex")
                    }
            }
            .font(.headline)
        }
    }
}
