// swiftlint:disable all
import SwiftUI
import DesignSystem
import STGamification

// MARK: - QuestDetailView

/// Details for a quest with completion option.
public struct QuestDetailView: View {
    public var quest: Quest
    @Binding var quests: [Quest]
    @StateObject private var engine = GamificationEngine()
    @Environment(\.dismiss) private var dismiss

    public init(quest: Quest, quests: Binding<[Quest]>) {
        self.quest = quest
        self._quests = quests
    }

    public var body: some View {
        VStack(spacing: Spacing.md) {
            Text(quest.title)
                .font(AppFont.title())
                .multilineTextAlignment(.center)
            Text("Beschreibung kommt bald …")
            Text("XP: \(quest.xp)")
                .font(AppFont.body())

            Button("Abschließen") {
                completeQuest()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(Spacing.md)
    }

    private func completeQuest() {
        guard let index = quests.firstIndex(where: { $0.id == quest.id }) else { return }
        if !quests[index].isCompleted {
            quests[index].isCompleted = true
            engine.markCompleted(DailyTask(title: quest.title, xp: quest.xp))
        }
        dismiss()
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    QuestDetailView(quest: TandemDemoData.quests[0], quests: .constant(TandemDemoData.quests))
}
#endif
