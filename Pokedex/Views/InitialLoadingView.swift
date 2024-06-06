import SwiftUI

struct InitialLoadingView: View {
    @State private var isRotating = false
    
    var body: some View {
        VStack {
            Image("pokeball")
                .rotationEffect(.degrees(isRotating ? 360 : 0))
                .animation(
                    Animation.linear(duration: 1)
                        .repeatForever(autoreverses: false)
                )
                .onAppear {
                    self.isRotating = true
                }
            
            Text("Loading...")
                .foregroundStyle(.white)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBlue))
        .ignoresSafeArea()
    }
}

#Preview {
    InitialLoadingView()
}
