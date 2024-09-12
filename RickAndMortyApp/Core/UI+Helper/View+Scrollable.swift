import SwiftUI

/// A View extension to conditionally make a view scrollable.
/// This extension provides a method to wrap the view in a `ScrollView` if scrolling is enabled.
extension View {
    /// Conditionally wraps the view in a `ScrollView`.
    /// - Parameters:
    ///   - scroll: A Boolean value indicating whether scrolling should be enabled. Defaults to `true`.
    ///   - axis: The scrollable axes. Defaults to `.vertical`.
    ///   - showsIndicators: A Boolean value indicating whether scroll indicators should be visible. Defaults to `false`.
    /// - Returns: A view that is optionally wrapped in a `ScrollView` based on the `scroll` parameter.
    @ViewBuilder
    func scrollable(
        _ scroll: Bool = true,
        axis: Axis.Set = .vertical,
        showsIndicators: Bool = false
    ) -> some View {
        if scroll {
            ScrollView(axis, showsIndicators: showsIndicators) {
                self
            }
        } else {
            self
        }
    }
}
