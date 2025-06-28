import XCTest
import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
@testable import DesignSystem

final class AppColorTests: XCTestCase {
    func testPrimary600Components() {
        #if canImport(UIKit)
        let baseColor = UIColor(Color.AppColor.primary600)
        #elseif canImport(AppKit)
        let baseColor = NSColor(Color.AppColor.primary600)
        #endif
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        baseColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        XCTAssertEqual(r, 47.0 / 255.0, accuracy: 0.001)
        XCTAssertEqual(g, 10.0 / 255.0, accuracy: 0.001)
        XCTAssertEqual(b, 145.0 / 255.0, accuracy: 0.001)
        XCTAssertEqual(a, 1.0, accuracy: 0.001)
    }
}
