import SwiftUI

struct PokemonListView: View {
    @State var pokemons: [Pokemon]!
    @State private var searchText = ""
    
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPokemons) { pokemon in
                NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                    PokemonListCellView(pokemon: pokemon)
                }
            }
            .searchable(
                text: $searchText,
                prompt: "Search"
            ) {
                if !searchText.isEmpty {
                    Text("TOP NAME MATCHES")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                ForEach(filteredPokemons) { pokemon in
                    NavigationLink(destination: PokemonDetailsView(pokemon: pokemon)) {
                        Text(pokemon.name.capitalized)
                            .foregroundStyle(.black)
                    }
                }
            }
            
            Button("Load more...") {
                Task {
                    PokeAPI.shared.currentPage = PokeAPI.shared.currentPage.next()
                    let newPokemons = await PokeAPI.shared.getPokemons()
                    pokemons.append(contentsOf: newPokemons)
                }
            }
            .padding()
        }
    }
}
