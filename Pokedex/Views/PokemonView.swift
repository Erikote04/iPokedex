import SwiftUI

struct PokemonView: View {
    @State var index: Int = 0
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        VStack {
            Spacer()
            
            if index < pokemons.count {
                PokemonDetails(pokemon: pokemons[index])
                
                HStack {
                    PokemonButton(title: "Previous") {
                        if index > 0 {
                            index -= 1
                        } else {
                            index = pokemons.count - 1
                        }
                    }
                    
                    PokemonButton(title: "Next") {
                        if index < pokemons.count - 1 {
                            index += 1
                        } else {
                            index = 0
                        }
                    }
                }
                
                Spacer()
            }
        }
        // .background(pokemons[index].color)
        .onAppear {
            getPokemons { pokemons in
                self.pokemons = pokemons
            }
        }
    }
}

#Preview {
    PokemonView()
}
