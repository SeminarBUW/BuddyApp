import XCTest
@testable import SETandemCore

final class GlossaryFilterTests: XCTestCase {
    func testFilterByTerm() {
        let items = TandemDemoData.glossary
        let filtered = items.filter { $0.term.localizedCaseInsensitiveContains("werk") }
        XCTAssertEqual(filtered.count, 1)
    }
}
