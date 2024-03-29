import SwiftUI

struct PokemonButton: View {
    let width = 100.0
    let height = 40.0
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: width, height: height, alignment: .center)
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(8)
        }.padding(8.0)
    }
}

#Preview {
    PokemonButton(title: "Click") {}
        .previewLayout(.sizeThatFits)
}
