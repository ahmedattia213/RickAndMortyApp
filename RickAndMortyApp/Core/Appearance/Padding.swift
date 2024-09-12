import SwiftUI

extension View {
    /// Apply padding with a specific edge insets and spacing.
    func padding(_ insets: Edge.Set = .all, spacing: Spacing) -> some View {
        padding(insets, spacing.pts)
    }
    
    /// Apply horizontal padding using the standard spacing.
    func horizontalPadding() -> some View {
        padding(.horizontal, spacing: .horizontal)
    }
}
