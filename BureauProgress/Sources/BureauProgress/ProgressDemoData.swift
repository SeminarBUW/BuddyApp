import Foundation

// MARK: - Demo Data

/// Demo data for BureauProgress
public enum ProgressDemoData {
    /// Returns the demo progress plan for citizenship with six milestones.
    public static var demoPlan: ProgressPlan {
        let calendar = Calendar.current
        let today = Date()
        let milestones = [
            Milestone(title: "Aufenthaltsdauer", dueDate: calendar.date(byAdding: .month, value: 1, to: today)!, iconName: "calendar"),
            Milestone(title: "Sprachtest", dueDate: calendar.date(byAdding: .month, value: 2, to: today)!, iconName: "book"),
            Milestone(title: "Integrationskurs", dueDate: calendar.date(byAdding: .month, value: 4, to: today)!, iconName: "graduationcap"),
            Milestone(title: "Antragsformular", dueDate: calendar.date(byAdding: .month, value: 5, to: today)!, iconName: "doc.text"),
            Milestone(title: "Einbürgerungstest", dueDate: calendar.date(byAdding: .month, value: 6, to: today)!, iconName: "checkmark.seal"),
            Milestone(title: "Zeremonie", dueDate: calendar.date(byAdding: .month, value: 8, to: today)!, iconName: "flag")
        ]
        return ProgressPlan(title: "Einbürgerung", milestones: milestones)
    }
}
