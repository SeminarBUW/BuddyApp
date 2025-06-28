import XCTest
@testable import SEEmployerPortal

final class FeedbackSaveTests: XCTestCase {
    func testSaveFeedback() {
        let manager = FeedbackManager()
        XCTAssertEqual(manager.feedbacks.count, 0)
        manager.save(rating: 4, comment: "Great")
        XCTAssertEqual(manager.feedbacks.count, 1)
        XCTAssertEqual(manager.feedbacks[0].rating, 4)
        XCTAssertEqual(manager.feedbacks[0].comment, "Great")
    }
}
