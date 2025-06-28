// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Course List

/// Displays the available lessons as a searchable grid.
public struct CourseListView: View {
    @State private var lessons: [Lesson] = Lesson.mockData()
    @State private var query: String = ""
    @Environment(\.horizontalSizeClass) private var sizeClass

    private var columns: [GridItem] {
        let count = sizeClass == .regular ? 3 : 2
        return Array(repeating: GridItem(.flexible(), spacing: Spacing.md), count: count)
    }

    private var filtered: [Lesson] {
        filterLessons(lessons, query: query)
    }

    public init() {}

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: Spacing.md) {
                ForEach(filtered) { lesson in
                    NavigationLink(destination: LessonPlayerView(lesson: lesson)) {
                        LessonCardView(lesson: lesson)
                    }
                    .accessibilityLabel("Lektion \(lesson.title) Fortschritt \(Int(lesson.progress * 100)) Prozent")
                }
            }
            .padding(Spacing.md)
        }
        .navigationTitle("Kurse")
        .searchable(text: $query)
    }
}

// MARK: - Card
struct LessonCardView: View {
    let lesson: Lesson

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Image(lesson.thumbnailName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
            Text(lesson.title)
                .font(AppFont.body())
            Text(lesson.level)
                .font(AppFont.caption())
                .padding(4)
                .background(Color.AppColor.primary400)
                .foregroundColor(.white)
                .cornerRadius(8)
            ProgressView(value: lesson.progress)
                .progressViewStyle(.circular)
                .tint(Color.AppColor.accent)
                .frame(height: 40)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.AppColor.background))
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { CourseListView() }
}
#endif
