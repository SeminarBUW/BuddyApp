// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Daily Task Row

/// Row representing a single daily task.
struct DailyTaskRowView: View {
    var task: DailyTask
    var onToggle: () -> Void

    @State private var isCompleted: Bool

    init(task: DailyTask, onToggle: @escaping () -> Void) {
        self.task = task
        self.onToggle = onToggle
        _isCompleted = State(initialValue: task.isCompleted)
    }

    var body: some View {
        Button(action: {
            if !isCompleted {
                isCompleted = true
                onToggle()
            }
        }) {
            HStack {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isCompleted ? Color.AppColor.accent : .secondary)
                Text(task.title)
                    .font(AppFont.body())
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.AppColor.background))
            .scaleEffect(isCompleted ? 0.97 : 1.0)
        }
        .buttonStyle(.plain)
        .animation(.easeInOut, value: isCompleted)
        .accessibilityLabel("Aufgabe \(task.title)")
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    DailyTaskRowView(task: DailyTask.demoTasks[0]) {}
        .padding()
}
#endif
