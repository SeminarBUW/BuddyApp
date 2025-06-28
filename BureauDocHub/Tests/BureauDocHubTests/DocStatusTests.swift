import XCTest
@testable import BureauDocHub

final class DocStatusTests: XCTestCase {
    func testMarkDone() {
        var docs = BureauDemoData.docs
        let doc = docs[0]
        markDocDone(doc, in: &docs)
        XCTAssertEqual(docs[0].status, .done)
    }
}
