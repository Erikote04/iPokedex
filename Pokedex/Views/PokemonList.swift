import SwiftUI

struct PokemonList: View {
    let pokemons: [Pokemon]!
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetails(pokemon: pokemon)) {
                    PokemonItem(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokemonList(pokemons: [Pokemon(id: 35,
                                   name: "clefairy",
                                   weight: 75,
                                   sprites: Pokemon.Sprite(
                                    other: Pokemon.Sprite.Other(
                                        officialArtwork: Pokemon.Sprite.Other.Artwork(
                                            frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png"
                                        )
                                    )
                                   ),
                                   types: [
                                    Pokemon.PokemonType(
                                        type: Pokemon.PokemonType.InnerPokemonType(
                                            name: "fairy",
                                            url: "https://pokeapi.co/api/v2/type/18/"
                                        )
                                    )
                                   ]
                                  )])
}
