import SwiftUI

/// A button that triggers haptic feedback when pressed.
/// The haptic feedback style can be customized.
struct HapticButton<Content: View>: View {
    let action: () -> Void
    let content: Content
    let hapticImpactStyle: UIImpactFeedbackGenerator.FeedbackStyle
    
    /// Initializes a new `HapticButton` with the specified action, haptic feedback style, and content.
    /// - Parameters:
    ///   - action: The action to perform when the button is pressed.
    ///   - hapticImpactStyle: The style of haptic feedback to generate. Defaults to `.medium`.
    ///   - content: A closure that returns the content of the button.
    init(action: @escaping () -> Void, hapticImpactStyle: UIImpactFeedbackGenerator.FeedbackStyle = .medium, @ViewBuilder content: () -> Content) {
        self.action = action
        self.hapticImpactStyle = hapticImpactStyle
        self.content = content()
    }
    
    var body: some View {
        Button(action: {
            Haptics.impact(style: hapticImpactStyle)
            self.action()
        }) {
            content
        }
    }
}
