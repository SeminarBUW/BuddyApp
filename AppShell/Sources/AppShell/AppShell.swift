// swiftlint:disable all
import SwiftUI

public struct AppShell {
    public init() {}

    /// Factory for the application's root view.
    public static func rootView() -> some View {
        BottomTabBarView()
    }
}
