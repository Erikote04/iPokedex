import SwiftUI

struct InitialLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .padding()
            
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
