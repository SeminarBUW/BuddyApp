import XCTest
@testable import STCurriculum

final class LessonPlayerNavigationTests: XCTestCase {
    func testNavigationCompletion() {
        let sections = [
            LessonSection(title: "One", content: "1"),
            LessonSection(title: "Two", content: "2"),
            LessonSection(title: "Three", content: "3")
        ]
        let lesson = Lesson(title: "Test", level: "A1", thumbnailName: "t", sections: sections)
        let viewModel = LessonPlayerViewModel(lesson: lesson)

        XCTAssertFalse(viewModel.isCompleted)
        viewModel.next()
        XCTAssertFalse(viewModel.isCompleted)
        viewModel.next()
        XCTAssertFalse(viewModel.isCompleted)
        viewModel.next()
        XCTAssertTrue(viewModel.isCompleted)
    }
}
