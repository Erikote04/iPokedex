import SwiftUI

@main
struct PokedexApp: App {
    
    // #if TESTING
    let isRunningTest = NSClassFromString("XCTTestCase") != nil
    // #endif
    
    @State var pokemons: [Pokemon]!
    @State var loaded = false
    
    var body: some Scene {
        WindowGroup {
            if loaded {
                PokemonTabView(pokemons: pokemons)
            } else {
                if isRunningTest {
                    Text("Testing")
                } else {
                    InitialLoadingView()
                        .onAppear {
                            getPokemons { pokemons in
                                self.pokemons = pokemons
                                loaded = true
                            }
                        }
                }
            }
        }
    }
}
