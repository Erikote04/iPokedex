import SwiftUI

struct PokemonView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                NavigationButton(title: "<") {
                    print("left")
                }
                
                NavigationButton(title: ">") {
                    print("right")
                }
            }
        }
    }
}

struct NavigationButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding(.horizontal, 80)
            .padding(.vertical, 40)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PokemonView()
}
