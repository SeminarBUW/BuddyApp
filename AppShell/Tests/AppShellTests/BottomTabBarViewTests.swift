import XCTest
import SwiftUI
@testable import AppShell

#if canImport(UIKit)
import UIKit
#endif

final class BottomTabBarViewTests: XCTestCase {
#if canImport(UIKit)
    func testTabItemCount() {
        let view = BottomTabBarView()
        let host = UIHostingController(rootView: view)
        host.loadViewIfNeeded()
        let controller = host.children.first { $0 is UITabBarController } as? UITabBarController
        XCTAssertEqual(controller?.tabBar.items?.count, 5)
    }
#endif
}
