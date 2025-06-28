// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Daily Dashboard

/// Shows today's tasks, streak and XP progress.
public struct DailyDashboardView: View {
    @StateObject private var engine = GamificationEngine()
    @State private var showGames = false

    public init() {}

    public var body: some View {
        VStack(spacing: Spacing.md) {
            header
            xpRing
            taskList
            Button("Mini-Games anzeigen") { showGames = true }
        }
        .padding(Spacing.md)
        .sheet(isPresented: $showGames) {
            NavigationStack { MiniGameHubView() }
        }
    }

    private var header: some View {
        HStack(spacing: Spacing.sm) {
            Text("🔥 \(engine.currentStreak)")
                .font(AppFont.subtitle())
                .padding(8)
                .background(Circle().fill(Color.AppColor.accent))
                .foregroundColor(.white)
                .accessibilityLabel("Streak \(engine.currentStreak) Tage")
            Spacer()
        }
    }

    private var xpRing: some View {
        ProgressView(value: min(Double(engine.totalXP) / 100.0, 1.0))
            .progressViewStyle(.circular)
            .tint(Color.AppColor.primary400)
            .frame(height: 60)
    }

    private var taskList: some View {
        VStack(spacing: Spacing.sm) {
            ForEach(engine.tasks) { task in
                DailyTaskRowView(task: task) { engine.markCompleted(task) }
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    DailyDashboardView()
}
#endif
