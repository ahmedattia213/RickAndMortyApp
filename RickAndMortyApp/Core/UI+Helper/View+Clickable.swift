import SwiftUI

/// An extension that provides a `clickable()` modifier for views to make them interactive.
extension View {
    
    /// Adds a `clickable()` modifier to the view, making it interactive and tappable.
    ///
    /// Example:
    /// ```
    /// Text("Click me")
    ///     .clickable()
    ///     .onTapGesture {
    ///         // Handle tap action here
    ///     }
    /// ```
    ///
    /// - Returns: A view with the `clickable()` modifier.
    func clickable() -> some View {
        self
            .contentShape(Rectangle())
    }
}
