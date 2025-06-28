import SwiftUI
import DesignSystem

// MARK: - ProgressTrackerView

/// View displaying milestones in a timeline and progress percentage.
public struct ProgressTrackerView: View {
    @State private var plan: ProgressPlan = ProgressDemoData.demoPlan
    @State private var selected: Milestone?

    public init() {}

    public var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            Text("Einbürgerungs-Fortschritt")
                .font(AppFont.title())
            ProgressView(value: plan.completion)
                .tint(AppColor.accent)
            ScrollView {
                VStack(spacing: Spacing.sm) {
                    ForEach(plan.milestones) { milestone in
                        NavigationLink(value: milestone) {
                            MilestoneRowView(milestone: milestone)
                        }
                    }
                }
            }
            .navigationDestination(for: Milestone.self) { milestone in
                MilestoneDetailView(milestone: binding(for: milestone))
            }
        }
        .padding()
    }

    private func binding(for milestone: Milestone) -> Binding<Milestone> {
        guard let index = plan.milestones.firstIndex(where: { $0.id == milestone.id }) else {
            return .constant(milestone)
        }
        return $plan.milestones[index]
    }
}

#Preview {
    NavigationStack {
        ProgressTrackerView()
    }
}
