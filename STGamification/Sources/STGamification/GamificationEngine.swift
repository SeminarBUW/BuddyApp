// swiftlint:disable all
import Foundation

// MARK: - Gamification Engine

/// Handles daily tasks and XP tracking.
public final class GamificationEngine: ObservableObject {
    @Published public private(set) var currentStreak: Int
    @Published public private(set) var totalXP: Int
    @Published public private(set) var tasks: [DailyTask]

    private var lastCompletionDate: Date?

    public init(tasks: [DailyTask] = DailyTask.demoTasks) {
        self.currentStreak = 0
        self.totalXP = 0
        self.tasks = tasks
    }

    /// Marks a task as completed and updates streak and XP.
    public func markCompleted(_ task: DailyTask) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        if tasks[index].isCompleted { return }
        tasks[index].isCompleted = true
        totalXP += tasks[index].xp
        updateStreakIfNeeded()
    }

    /// Resets tasks when a new day has started.
    public func resetTasksIfNewDay(now: Date = Date()) {
        guard let last = lastCompletionDate else { return }
        if !Calendar.current.isDate(last, inSameDayAs: now) {
            tasks = tasks.map { DailyTask(id: $0.id, title: $0.title, isCompleted: false, xp: $0.xp) }
            lastCompletionDate = nil
        }
    }

    private func updateStreakIfNeeded() {
        let today = Date()
        defer { lastCompletionDate = today }
        guard let last = lastCompletionDate else {
            currentStreak = 1
            return
        }
        if Calendar.current.isDate(today, inSameDayAs: last) {
            // already counted today
        } else if Calendar.current.isDate(today, equalTo: Calendar.current.date(byAdding: .day, value: 1, to: last)!, toGranularity: .day) {
            currentStreak += 1
        } else {
            currentStreak = 1
        }
    }
}
