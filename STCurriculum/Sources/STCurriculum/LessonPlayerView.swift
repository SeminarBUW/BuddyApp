// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - ViewModel

/// View model driving `LessonPlayerView` navigation.
public final class LessonPlayerViewModel: ObservableObject {
    @Published public private(set) var lesson: Lesson
    @Published public private(set) var currentIndex: Int = 0
    @Published public var isCompleted: Bool = false

    public init(lesson: Lesson) {
        self.lesson = lesson
    }

    public func next() {
        if currentIndex < lesson.sections.count - 1 {
            currentIndex += 1
        } else {
            isCompleted = true
        }
        updateProgress()
    }

    public func previous() {
        if currentIndex > 0 {
            currentIndex -= 1
            isCompleted = false
        }
        updateProgress()
    }

    private func updateProgress() {
        lesson.progress = Double(currentIndex) / Double(lesson.sections.count)
    }
}

// MARK: - Lesson Player View

/// Plays a lesson by paging through its sections.
public struct LessonPlayerView: View {
    @StateObject private var viewModel: LessonPlayerViewModel
    @Environment(\.dismiss) private var dismiss

    public init(lesson: Lesson) {
        _viewModel = StateObject(wrappedValue: LessonPlayerViewModel(lesson: lesson))
    }

    public var body: some View {
        VStack {
            TabView(selection: $viewModel.currentIndex) {
                ForEach(Array(viewModel.lesson.sections.enumerated()), id: \.element.id) { index, section in
                    LessonSectionView(section: section)
                        .tag(index)
                        .padding(.horizontal)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))

            bottomBar
        }
        .onChange(of: viewModel.isCompleted) { completed in
            if completed { dismiss() }
        }
    }

    private var bottomBar: some View {
        HStack {
            Button("Zurück") { viewModel.previous() }
                .disabled(viewModel.currentIndex == 0)
            ProgressView(value: viewModel.lesson.progress)
                .progressViewStyle(.linear)
                .tint(Color.AppColor.accent)
                .frame(maxWidth: .infinity)
            Button(viewModel.currentIndex == viewModel.lesson.sections.count - 1 ? "Fertig" : "Weiter") {
                viewModel.next()
            }
        }
        .padding()
    }
}

// MARK: - Section View
struct LessonSectionView: View {
    let section: LessonSection
    @State private var isPlaying = false

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Text(section.title)
                .font(AppFont.subtitle())
            ScrollView {
                Text(section.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            if section.audioURL != nil {
                Button(isPlaying ? "Stop" : "Play") {
                    isPlaying.toggle()
                }
            }
            Spacer()
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    LessonPlayerView(lesson: Lesson.mockData().first!)
}
#endif
