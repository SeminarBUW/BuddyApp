// swiftlint:disable all
import SwiftUI
import DesignSystem
import STGamification

// MARK: - TandemHomeView

/// Starting point for Tandem participants.
public struct TandemHomeView: View {
    @State private var quests: [Quest]
    @State private var showDiary = false
    @State private var showGlossary = false
    @State private var selectedQuest: Quest?

    private var progress: Double {
        guard !quests.isEmpty else { return 0 }
        let completed = quests.filter { $0.isCompleted }.count
        return Double(completed) / Double(quests.count)
    }

    public init(quests: [Quest] = TandemDemoData.quests) {
        _quests = State(initialValue: quests)
    }

    public var body: some View {
        VStack(spacing: Spacing.md) {
            Text("Hallo, Ali!")
                .font(AppFont.title())

            ProgressView(value: progress)
                .tint(Color.AppColor.accent)
                .frame(height: 10)

            if let quest = quests.first(where: { !$0.isCompleted }) {
                QuestCard(quest: quest) {
                    selectedQuest = quest
                }
            }

            HStack(spacing: Spacing.md) {
                Button("Tagebuch") { showDiary = true }
                    .buttonStyle(.borderedProminent)
                Button("Glossar") { showGlossary = true }
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding(Spacing.md)
        .sheet(item: $selectedQuest) { quest in
            NavigationStack { QuestDetailView(quest: quest, quests: $quests) }
        }
        .sheet(isPresented: $showDiary) { NavigationStack { DiaryView() } }
        .sheet(isPresented: $showGlossary) { NavigationStack { GlossaryView() } }
    }
}

private struct QuestCard: View {
    var quest: Quest
    var onStart: () -> Void

    var body: some View {
        VStack(spacing: Spacing.sm) {
            Text(quest.title)
                .font(AppFont.subtitle())
                .multilineTextAlignment(.center)
            Button("Start", action: onStart)
                .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.AppColor.primary400))
        .foregroundColor(.white)
        .accessibilityLabel("Quest \(quest.title)")
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    TandemHomeView()
}
#endif
