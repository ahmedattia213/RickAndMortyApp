import SwiftUI

enum Spacing: CGFloat {
    case zero = 0
    case paddingHalf = 2
    case padding1 = 4
    case padding2 = 8
    case padding3 = 12
    case padding4 = 16
    case padding5 = 20
    case padding10 = 40

    /// Get the spacing value in points.
    var pts: CGFloat { rawValue }
}

extension Spacing {
    static let horizontal: Spacing = .padding5
}
