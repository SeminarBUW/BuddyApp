import XCTest
import UserNotifications
@testable import BureauProgress

final class ReminderScheduleTests: XCTestCase {
    func testScheduleDate() async throws {
        let milestone = Milestone(title: "Test", dueDate: Date().addingTimeInterval(60 * 60 * 24 * 10), iconName: "calendar")
        let service = ReminderService.shared
        let exp = expectation(description: "scheduled")
        service.scheduleReminder(for: milestone) { _ in exp.fulfill() }
        await waitForExpectations(timeout: 1)
        let check = expectation(description: "fetch")
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            let exists = requests.contains { $0.identifier == milestone.id.uuidString }
            XCTAssertTrue(exists)
            check.fulfill()
        }
        await waitForExpectations(timeout: 1)
    }
}
