import SwiftUI

let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")

let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")

let squitleURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png")

let pokemons = [
    bulbasaurURL,
    charmanderURL,
    squitleURL,
]

let pokemonColor = [
    Color.green,
    Color.orange,
    Color.cyan,
]

struct PokemonView: View {
    
    @State var index: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            AsyncImage(url: pokemons[index])
            
            Spacer()
            
            HStack {
                NavigationButton(title: "Previous") {
                    if index > 0 {
                        index -= 1
                    } else {
                        index = pokemons.count - 1
                    }
                }
                
                NavigationButton(title: "Next") {
                    if index < pokemons.count - 1 {
                        index += 1
                    } else {
                        index = 0
                    }
                }
            }
            
            Spacer()
        }.background(pokemonColor[index])
    }
}

struct NavigationButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding(.vertical, 20)
            .frame(width: 120)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(8)
    }
}

#Preview {
    PokemonView()
}
