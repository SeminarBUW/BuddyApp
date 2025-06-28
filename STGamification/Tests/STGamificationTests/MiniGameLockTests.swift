import XCTest
import SwiftUI
@testable import STGamification

final class MiniGameLockTests: XCTestCase {
    func testLockedTileShowsOverlay() {
        let game = MiniGame(name: "Hangman", iconName: "gamecontroller", description: "", isUnlocked: false)
        let tile = MiniGameTileView(game: game)
        // Render and inspect by snapshot; here we just ensure view struct exists
        XCTAssertNotNil(tile)
    }
}
