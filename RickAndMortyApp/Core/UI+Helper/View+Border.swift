import SwiftUI

extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(color, lineWidth: width))
    }
}

#if DEBUG
#Preview {
    Color.white.opacity(0.05)
        .frame(width: 300, height: 300)
        .border(.red, width: 2, cornerRadius: 20)
        .backgroundZStack()
}
#endif
