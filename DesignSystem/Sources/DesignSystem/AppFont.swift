// swiftlint:disable all
import SwiftUI

// MARK: - Typography

enum AppFont {
    static func title() -> Font {
        Font.system(size: 28, weight: .bold, design: .rounded)
    }

    static func subtitle() -> Font {
        Font.system(size: 20, weight: .semibold, design: .rounded)
    }

    static func body() -> Font {
        Font.system(size: 16, weight: .regular, design: .rounded)
    }

    static func caption() -> Font {
        Font.system(size: 12, weight: .regular, design: .rounded)
    }
}
