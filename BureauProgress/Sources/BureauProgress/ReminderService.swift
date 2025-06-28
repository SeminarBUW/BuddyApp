import Foundation
import UserNotifications
import SwiftUI

// MARK: - ReminderService

/// Service responsible for scheduling local reminders for milestones.
public final class ReminderService {
    public static let shared = ReminderService()
    private let center = UNUserNotificationCenter.current()

    private init() {}

    /// Schedules a reminder 3 days before the milestone due date at 09:00.
    public func scheduleReminder(for milestone: Milestone, completion: @escaping (Bool) -> Void) {
        requestAuthorization { granted in
            guard granted else { completion(false); return }
            let triggerDate = Calendar.current.date(byAdding: .day, value: -3, to: milestone.dueDate) ?? milestone.dueDate
            var components = Calendar.current.dateComponents([.year, .month, .day], from: triggerDate)
            components.hour = 9
            let content = UNMutableNotificationContent()
            content.title = milestone.title
            content.body = "Bald fällig"
            content.sound = .default
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            let request = UNNotificationRequest(identifier: milestone.id.uuidString, content: content, trigger: trigger)
            self.center.add(request) { _ in }
            completion(true)
        }
    }

    /// Cancels a previously scheduled reminder.
    public func cancelReminder(id: UUID) {
        center.removePendingNotificationRequests(withIdentifiers: [id.uuidString])
    }

    private func requestAuthorization(completion: @escaping (Bool) -> Void) {
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                completion(true)
            } else {
                self.center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
                    completion(granted)
                }
            }
        }
    }
}
