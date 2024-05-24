import SwiftUI

struct InitialLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .padding()
            
            Text("Loading...")
        }
    }
}

#Preview {
    InitialLoadingView()
}
