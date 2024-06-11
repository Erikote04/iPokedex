import SwiftUI

struct CustomDivider: View {
    let height: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(height: height)
            .padding(.horizontal)
    }
}
