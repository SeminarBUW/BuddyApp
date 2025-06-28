import XCTest
@testable import SEAgencyAdmin

final class CertificateSortingTests: XCTestCase {
    func testSortByDateDescending() {
        let certs = AgencyDemoData.certificates
        let sorted = certs.sorted { $0.issuedAt > $1.issuedAt }
        XCTAssertTrue(sorted.first!.issuedAt >= sorted.last!.issuedAt)
    }
}
