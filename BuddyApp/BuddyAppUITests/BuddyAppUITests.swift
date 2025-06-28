import XCTest

final class BuddyAppUITests: XCTestCase {
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.tabBars.buttons["Sprachtool"].exists)
    }
}
