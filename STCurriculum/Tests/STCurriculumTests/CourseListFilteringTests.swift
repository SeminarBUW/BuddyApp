import XCTest
@testable import STCurriculum

final class CourseListFilteringTests: XCTestCase {
    func testFilteringByTitleAndLevel() {
        let lessons = Lesson.mockData()
        let filteredA1 = filterLessons(lessons, query: "A1")
        XCTAssertEqual(filteredA1.count, lessons.filter { $0.level == "A1" }.count)

        let firstTitle = lessons.first!.title
        let filteredTitle = filterLessons(lessons, query: firstTitle)
        XCTAssertEqual(filteredTitle.count, 1)

        let empty = filterLessons(lessons, query: "")
        XCTAssertEqual(empty.count, lessons.count)
    }
}
