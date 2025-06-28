import SwiftUI
import DesignSystem

// MARK: - MilestoneRowView

/// Single row representing a milestone in the timeline.
public struct MilestoneRowView: View {
    public var milestone: Milestone

    public init(milestone: Milestone) {
        self.milestone = milestone
    }

    var indicatorColor: Color {
        switch milestone.status {
        case .done:
            return AppColor.accent
        case .overdue:
            return AppColor.danger
        case .pending:
            return AppColor.primary200
        }
    }

    public var body: some View {
        HStack(alignment: .center, spacing: Spacing.sm) {
            Circle()
                .fill(indicatorColor)
                .frame(width: 12, height: 12)
            VStack(alignment: .leading, spacing: 4) {
                Text(milestone.title)
                    .font(AppFont.body())
                Text(milestone.dueDate, style: .relative)
                    .font(AppFont.caption())
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: milestone.iconName)
        }
        .padding(Spacing.sm)
        .background(AppColor.background)
        .cornerRadius(12)
        .accessibilityLabel("Milestone \(milestone.title) fällig \(Text(milestone.dueDate, style: .relative))")
    }
}

#Preview {
    MilestoneRowView(milestone: ProgressDemoData.demoPlan.milestones.first!)
        .padding()
}
