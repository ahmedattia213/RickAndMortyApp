import SwiftUI

/// Icons class for managing app icons.
class Icons {
    // MARK: Common
    static let back = icon(for: "arrow-left")

    /// Resolves an icon image by name from the main bundle.
    /// - Parameters:
    ///   - name: The name of the image.
    ///   - renderingMode: The rendering mode of the image.
    /// - Returns: The resolved image.
    private static func icon(for name: String, renderingMode: Image.TemplateRenderingMode = .template) -> Image {
        Image(name, bundle: .main).renderingMode(renderingMode)
    }
}

// MARK: - ImageSize Enum
/// Enum defining image sizes for app icons.
enum ImageSize: CGFloat {
    case small = 20
    case medium = 28
    case large = 48

    /// Calculates the size based on the content size category.
    /// - Parameter size: The content size category.
    /// - Returns: The calculated size as CGSize.
    func value() -> CGSize {
        .init(width: rawValue, height: rawValue)
    }
}

struct Colors {
    static var textPrimary = Color.textPrimary
}

// MARK: - Image Extensions
extension Image {
    /// Applies a size modifier to the image.
    /// - Parameters:
    ///   - size: The desired image size.
    ///   - color: The color of the image.
    /// - Returns: The modified image.
    func size(_ size: ImageSize, color: Color = Colors.textPrimary) -> some View {
        self
            .resizable()
            .modifier(ImageDynamicSizeModifier(size: size, color: color))
    }
}

// MARK: - ImageDynamicSizeModifier
/// View modifier for dynamically sizing an image.
struct ImageDynamicSizeModifier: ViewModifier {
    let size: ImageSize
    let color: Color

    func body(content: Content) -> some View {
        let size = size.value()

        return content
            .scaledToFit()
            .frame(height: size.height)
            .foregroundColor(color)
            .clickable()
    }
}
