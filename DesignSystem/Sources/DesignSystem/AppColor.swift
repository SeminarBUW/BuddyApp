// swiftlint:disable all
import SwiftUI

// MARK: - Color Tokens

extension Color {
    private init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }

    enum AppColor {
        static let primary600 = Color(hex: 0x2F0A91)
        static let primary400 = Color(hex: 0x5B0A91)
        static let primary200 = Color(hex: 0x6F3B91)
        static let accent = Color(hex: 0x248995)
        static let danger = Color(hex: 0xF58B91)
        static let background = Color(hex: 0xF2DFFF)
    }
}
