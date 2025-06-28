import XCTest
@testable import SEAgencyAdmin

final class TandemFilterTests: XCTestCase {
    func testFilterActiveAndCompleted() {
        let tandems = AgencyDemoData.tandems
        let filtered = tandems.filter { $0.status == .active || $0.status == .completed }
        XCTAssertEqual(filtered.count, 4)
    }
}
