import XCTest
@testable import BureauDocHub

final class FormWizardProgressTests: XCTestCase {
    func testCompletionAfterTwoNexts() {
        let steps = BureauDemoData.formSteps
        let vm = FormWizardViewModel(steps: steps)
        XCTAssertFalse(vm.isCompleted)
        vm.next()
        XCTAssertFalse(vm.isCompleted)
        vm.next()
        XCTAssertTrue(vm.isCompleted)
    }
}
