import XCTest
@testable import STGamification

final class GamificationEngineTests: XCTestCase {
    func testXPAndStreakGrow() {
        let engine = GamificationEngine(tasks: [DailyTask(title: "A", xp: 10)])
        engine.markCompleted(engine.tasks[0])
        XCTAssertEqual(engine.totalXP, 10)
        XCTAssertEqual(engine.currentStreak, 1)
    }

    func testResetTasks() {
        let engine = GamificationEngine(tasks: [DailyTask(title: "A", xp: 10)])
        engine.markCompleted(engine.tasks[0])
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        engine.resetTasksIfNewDay(now: tomorrow)
        XCTAssertFalse(engine.tasks[0].isCompleted)
    }
}
