import SwiftUI
import DesignSystem
import UserNotifications

// MARK: - MilestoneDetailView

/// Detailed screen for editing a milestone and scheduling reminders.
public struct MilestoneDetailView: View {
    @Binding var milestone: Milestone
    @State private var showAlert = false

    public init(milestone: Binding<Milestone>) {
        self._milestone = milestone
    }

    public var body: some View {
        Form {
            HStack {
                Image(systemName: milestone.iconName)
                TextField("Titel", text: $milestone.title)
            }
            DatePicker("Fällig am", selection: $milestone.dueDate, displayedComponents: .date)
            Toggle("Erledigt", isOn: Binding(get: { milestone.status == .done }, set: { milestone.status = $0 ? .done : .pending }))
            Button("Erinnerung setzen") {
                ReminderService.shared.scheduleReminder(for: milestone) { granted in
                    if !granted { showAlert = true }
                }
            }
        }
        .navigationTitle(milestone.title)
        .alert("Benachrichtigungen bitte aktivieren", isPresented: $showAlert) {}
    }
}

#Preview {
    NavigationStack {
        MilestoneDetailView(milestone: .constant(ProgressDemoData.demoPlan.milestones[1]))
    }
}
