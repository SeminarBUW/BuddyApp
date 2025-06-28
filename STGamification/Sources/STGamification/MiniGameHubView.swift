// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Mini Game Hub

/// Displays available mini games.
public struct MiniGameHubView: View {
    private let games: [MiniGame]

    public init(games: [MiniGame] = MiniGame.demoGames) {
        self.games = games
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: Spacing.md), count: 2), spacing: Spacing.md) {
                ForEach(games) { game in
                    MiniGameTileView(game: game)
                }
            }
            .padding(Spacing.md)
        }
        .navigationTitle("Mini-Games")
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { MiniGameHubView() }
}
#endif
