import XCTest
@testable import SETandemCore

final class DiaryCRUDTests: XCTestCase {
    func testAddAndRemoveEntry() {
        var entries = TandemDemoData.diaryEntries
        let newEntry = DiaryEntry(mood: "😀", notes: "Test")
        let initialCount = entries.count
        entries.append(newEntry)
        XCTAssertEqual(entries.count, initialCount + 1)
        entries.removeLast()
        XCTAssertEqual(entries.count, initialCount)
    }
}
