import SwiftUI

extension Pokemon.PokemonType: Identifiable {
    var id: String {
        self.type.name
    }
}

struct PokemonDataView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            HStack {
                Text("Type:")
                Spacer()
                ForEach(pokemon.types) { type in
                    Text(type.type.name.capitalized).bold()
                }
            }.padding(.horizontal)
            
            CustomDivider(height: 1)
            
            HStack {
                Text("Experience:")
                Spacer()
                Text("\(pokemon.experience)pts").bold()
            }.padding(.horizontal)
            
            CustomDivider(height: 1)
            
            HStack {
                Text("Weight:")
                Spacer()
                Text("\(format(pokemon.weight))kg").bold()
            }.padding(.horizontal)
            
            CustomDivider(height: 1)
            
            HStack {
                Text("Height:")
                Spacer()
                Text("\(format(pokemon.height))m").bold()
            }.padding(.horizontal)
            
            CustomDivider(height: 1)
        }.padding()
    }
}
