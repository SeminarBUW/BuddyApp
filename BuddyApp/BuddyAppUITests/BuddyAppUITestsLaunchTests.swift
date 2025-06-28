import XCTest

final class BuddyAppUITestsLaunchTests: XCTestCase {
    func testLaunchScreen() throws {
        let app = XCUIApplication()
        app.launch()
        let screenshot = app.screenshot()
        XCTAssertFalse(screenshot.pngRepresentation.isEmpty)
    }
}
