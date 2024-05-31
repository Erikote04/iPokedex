import SwiftUI

struct PokedexView: View {
    //    @State var index: Int = 0
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        VStack {
            TabView {
                ForEach(pokemons) { pokemon in
                    PokemonDetailsView(pokemon: pokemon)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .ignoresSafeArea()
            .task {
                let pokemons = await PokeApi().getPokemons()
                self.pokemons = pokemons.sorted { $0.id < $1.id }
            }
            
            Spacer()
        }
    }
}

#Preview {
    PokedexView()
}
