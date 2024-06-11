import SwiftUI

@main
struct PokedexApp: App {
    
    // #if TESTING
    let isRunningTest = NSClassFromString("XCTTestCase") != nil
    // #endif
    
    @State var pokemons: [Pokemon]?
    @State var loaded = false
    let capturedPokemonManager = CapturedPokemonManager()
    
    var body: some Scene {
        WindowGroup {
            if loaded {
                PokemonTabView(pokemons: pokemons ?? [])
                    .environmentObject(capturedPokemonManager)
            } else {
                if isRunningTest {
                    Text("Testing")
                } else {
                    InitialLoadingView()
                        .task {
                            let pokemons = await PokeAPI.shared.getPokemons()
                            loaded = true
                        }
                        .environmentObject(capturedPokemonManager)
                }
            }
        }
    }
}
