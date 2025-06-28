// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - AgencyDashboardView

/// Entry dashboard for agency administrators.
public struct AgencyDashboardView: View {
    @State private var showTandems = false
    @State private var showInsights = false
    @State private var showCerts = false
    private var username: String

    public init(username: String = "Admin") {
        self.username = username
    }

    public var body: some View {
        NavigationStack {
            VStack(spacing: Spacing.md) {
                Text("Agentur-Dashboard, \(username)")
                    .font(AppFont.title())

                HStack(spacing: Spacing.md) {
                    QuickTile(label: "Tandem-Verwaltung", systemName: "person.2", action: { showTandems = true })
                    QuickTile(label: "Insights", systemName: "chart.bar", action: { showInsights = true })
                    QuickTile(label: "Zertifikate", systemName: "doc.text", action: { showCerts = true })
                }
                Spacer()
            }
            .padding(Spacing.md)
            .navigationDestination(isPresented: $showTandems) { TandemAdminView() }
            .navigationDestination(isPresented: $showInsights) { InsightsView() }
            .navigationDestination(isPresented: $showCerts) { CertificateListView() }
        }
    }
}

private struct QuickTile: View {
    var label: String
    var systemName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: systemName)
                    .font(.largeTitle)
                Text(label)
                    .font(AppFont.caption())
            }
            .frame(width: 120, height: 120)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.AppColor.primary400))
            .foregroundColor(.white)
            .accessibilityLabel(label)
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    AgencyDashboardView()
}
#endif
