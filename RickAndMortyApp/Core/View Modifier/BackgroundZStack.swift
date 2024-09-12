import SwiftUI

/// A view modifier that sets a background color and allows for alignment within a `ZStack`.
/// This modifier also provides an option to hide the navigation bar.
struct BackgroundZStackModifier: ViewModifier {
    var alignment: Alignment
    var isNavigationBarHidden: Bool
    
    /// Modifies the content view by wrapping it in a `ZStack` with a background color and optional navigation bar hiding.
    /// - Parameter content: The content view to be modified.
    /// - Returns: A view wrapped in a `ZStack` with a background color and optional navigation bar hiding.
    func body(content: Content) -> some View {
        ZStack(alignment: alignment) {
            Color.backgroundPrimary
                .ignoresSafeArea(.all)
            content
                .navigationBarHidden(isNavigationBarHidden)
        }
    }
}

/// A view extension that applies the `BackgroundZStackModifier`.
extension View {
    /// Applies a `BackgroundZStackModifier` to the view.
    /// - Parameters:
    ///   - alignment: The alignment for the `ZStack`. Defaults to `.center`.
    ///   - isNavigationBarHidden: A Boolean value indicating whether the navigation bar should be hidden. Defaults to `true`.
    /// - Returns: A view modified with the `BackgroundZStackModifier`.
    func backgroundZStack(alignment: Alignment = .center, isNavigationBarHidden: Bool = true) -> some View {
        self.modifier(BackgroundZStackModifier(alignment: alignment, isNavigationBarHidden: isNavigationBarHidden))
    }
}
