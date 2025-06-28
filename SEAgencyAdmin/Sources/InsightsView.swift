// swiftlint:disable all
import SwiftUI
import Charts
import DesignSystem

// MARK: - InsightsView

/// Displays demo charts with agency stats.
public struct InsightsView: View {
    let tandems = AgencyDemoData.tandems

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.md) {
                Text("Tandems nach Status")
                    .font(AppFont.subtitle())
                Chart {
                    ForEach(TandemSummary.Status.allCases, id: \.self) { status in
                        BarMark(
                            x: .value("Status", status.rawValue),
                            y: .value("Anzahl", tandems.filter { $0.status == status }.count)
                        )
                        .foregroundStyle(Color.AppColor.primary400)
                    }
                }
                .frame(height: 200)

                Text("Abschlüsse pro Monat")
                    .font(AppFont.subtitle())
                Chart {
                    ForEach(0..<6) { index in
                        LineMark(
                            x: .value("Monat", index),
                            y: .value("Abschlüsse", Int.random(in: 0...5))
                        )
                        .foregroundStyle(Color.AppColor.accent)
                    }
                }
                .frame(height: 200)
            }
            .padding(Spacing.md)
        }
        .navigationTitle("Insights")
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { InsightsView() }
}
#endif
