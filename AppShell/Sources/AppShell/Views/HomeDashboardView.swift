// swiftlint:disable all
import SwiftUI
import DesignSystem

/// Dashboard shown on app launch.
public struct HomeDashboardView: View {
    // MARK: - Body
    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.md) {
                Text("Hallo, Integration Plus!")
                    .font(AppFont.title())
                    .padding(.top, Spacing.md)

                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: Spacing.md
                ) {
                    DashboardTileView(title: "Sprachtool", systemImage: "text.book.closed") {
                        SprachtoolOverviewView()
                    }
                    .accessibilityLabel("Sprachtool")

                    DashboardTileView(title: "KI-Assistent", systemImage: "brain") {
                        AssistantPlaceholderView()
                    }
                    .accessibilityLabel("KI-Assistent")

                    DashboardTileView(title: "Bürokratie", systemImage: "doc.text") {
                        BureauOverviewView()
                    }
                    .accessibilityLabel("Bürokratie")

                    DashboardTileView(title: "Sozialleben", systemImage: "person.3.sequence") {
                        SocialPlaceholderView()
                    }
                    .accessibilityLabel("Sozialleben")
                }
            }
            .padding(Spacing.md)
        }
    }
}

// MARK: - Tiles
struct DashboardTileView<Destination: View>: View {
    let title: String
    let systemImage: String
    let destination: Destination

    init(title: String, systemImage: String, @ViewBuilder destination: () -> Destination) {
        self.title = title
        self.systemImage = systemImage
        self.destination = destination()
    }

    var body: some View {
        NavigationLink(destination: destination) {
            VStack(spacing: Spacing.sm) {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                Text(title)
                    .font(AppFont.body())
                    .foregroundColor(.white)
            }
            .frame(width: 160, height: 160)
            .background(Color.AppColor.primary400)
            .cornerRadius(20)
        }
        .buttonStyle(ScaledButtonStyle())
    }
}

struct ScaledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

// MARK: - Placeholder Destinations
struct SprachtoolOverviewView: View {
    var body: some View { Text("Sprachtool Overview") }
}

struct AssistantPlaceholderView: View {
    var body: some View { Text("Coming soon …") }
}

struct BureauOverviewView: View {
    var body: some View { Text("Bureau Overview") }
}

struct SocialPlaceholderView: View {
    var body: some View { Text("Coming soon …") }
}

#if DEBUG
#Preview {
    NavigationStack { HomeDashboardView() }
}
#endif
