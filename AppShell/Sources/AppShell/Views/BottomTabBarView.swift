// swiftlint:disable all
import SwiftUI
import DesignSystem

/// Root view providing the main bottom tab bar.
public struct BottomTabBarView: View {
    // MARK: - Init
    public init() {
#if os(iOS)
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.AppColor.primary200)
#endif
    }

    // MARK: - Body
    public var body: some View {
        TabView {
            NavigationStack { HomeDashboardView() }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .accessibilityLabel("Home")

            NavigationStack { PlaceholderView() }
                .tabItem {
                    Label("Sprachtool", systemImage: "text.book.closed")
                }
                .accessibilityLabel("Sprachtool")

            NavigationStack { PlaceholderView() }
                .tabItem {
                    Label("Skill Exchange", systemImage: "person.2")
                }
                .accessibilityLabel("Skill Exchange")

            NavigationStack { PlaceholderView() }
                .tabItem {
                    Label("Bürokratie", systemImage: "doc.text")
                }
                .accessibilityLabel("Bürokratie")

            NavigationStack { PlaceholderView() }
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .accessibilityLabel("Settings")
        }
        .tint(Color.AppColor.primary600)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.AppColor.background)
                .shadow(color: Color.black.opacity(0.2), radius: 4)
                .ignoresSafeArea(edges: .bottom)
        )
    }
}

// MARK: - Placeholder
struct PlaceholderView: View {
    var body: some View {
        Text("Coming soon …")
            .font(AppFont.body())
            .padding()
    }
}

#if DEBUG
#Preview {
    BottomTabBarView()
}
#endif
