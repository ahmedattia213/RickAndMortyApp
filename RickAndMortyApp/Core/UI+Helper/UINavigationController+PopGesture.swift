import UIKit

/// An extension to `UINavigationController` to enable the interactive pop gesture recognizer.
/// This extension makes sure that the interactive pop gesture is enabled and functional,
/// allowing the user to swipe back to the previous view controller.
extension UINavigationController: UIGestureRecognizerDelegate {
    
    /// Overrides `viewDidLoad` to set the gesture recognizer's delegate to self.
    /// This ensures that the interactive pop gesture recognizer is enabled.
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    /// Determines whether the gesture recognizer should begin recognizing touches.
    ///
    /// - Parameter gestureRecognizer: The gesture recognizer to evaluate.
    /// - Returns: A Boolean value indicating whether the gesture recognizer should begin recognizing touches.
    ///            Returns `true` if the navigation controller has more than one view controller on its stack,
    ///            allowing the user to swipe back to the previous view controller. Otherwise, returns `false`.
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
