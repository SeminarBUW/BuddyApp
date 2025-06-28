import XCTest
@testable import BureauProgress

final class ProgressCalcTests: XCTestCase {
    func testCompletionCalculation() {
        var plan = ProgressDemoData.demoPlan
        plan.milestones[0].status = .done
        plan.milestones[1].status = .done
        plan.milestones[2].status = .done
        XCTAssertEqual(plan.completion, 0.5, accuracy: 0.001)
    }
}
