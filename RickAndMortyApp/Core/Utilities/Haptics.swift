import UIKit
import SwiftUI

/// A utility struct for providing haptic feedback.
struct Haptics {
    
    /// Call this method to trigger haptic feedback on supported devices
    /// using the specified impact style.
    ///
    /// - Parameter style: The style of impact feedback to generate (e.g., .light, .medium, .heavy).
    ///
    /// Example:
    /// ```
    ///     Haptics.impact(style: .light)
    /// ```
    static func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}
