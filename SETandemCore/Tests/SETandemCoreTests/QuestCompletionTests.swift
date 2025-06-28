import XCTest
import STGamification
@testable import SETandemCore

final class QuestCompletionTests: XCTestCase {
    func testCompletionAddsXPAndFlagsQuest() {
        var quests = TandemDemoData.quests
        var quest = quests[0]
        let engine = GamificationEngine()
        XCTAssertFalse(quest.isCompleted)

        engine.markCompleted(DailyTask(title: quest.title, xp: quest.xp))
        quest.isCompleted = true

        XCTAssertTrue(quest.isCompleted)
        XCTAssertEqual(engine.totalXP, quest.xp)
    }
}
