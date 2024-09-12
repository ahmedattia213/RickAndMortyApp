import SwiftUI

// Extend VStack to provide custom spacing using Spacing enum
extension VStack {
    /// Initializes a VStack with custom alignment and spacing.
    ///
    /// - Parameters:
    ///   - alignment: The horizontal alignment of the VStack.
    ///   - spacing: The custom spacing defined using the Spacing enum.
    ///   - content: A closure containing the content of the VStack.
    init(
        alignment: HorizontalAlignment = .center,
        spacing: Spacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: spacing.pts, content: content)
    }
}

// Extend HStack to provide custom spacing using Spacing enum
extension HStack {
    /// Initializes an HStack with custom alignment and spacing.
    ///
    /// - Parameters:
    ///   - alignment: The vertical alignment of the HStack.
    ///   - spacing: The custom spacing defined using the Spacing enum.
    ///   - content: A closure containing the content of the HStack.
    init(
        alignment: VerticalAlignment = .center,
        spacing: Spacing,
        @ViewBuilder content: () -> Content
    ) {
        self.init(alignment: alignment, spacing: spacing.pts, content: content)
    }
}
