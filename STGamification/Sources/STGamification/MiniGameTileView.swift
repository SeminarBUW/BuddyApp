// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Mini Game Tile

struct MiniGameTileView: View {
    let game: MiniGame
    @State private var showGame = false

    var body: some View {
        Button {
            if game.isUnlocked { showGame = true }
        } label: {
            VStack(spacing: Spacing.sm) {
                Image(systemName: game.iconName)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.AppColor.primary400))
                    .overlay(
                        Group {
                            if !game.isUnlocked {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.black.opacity(0.6))
                                    .overlay(Image(systemName: "lock.fill").foregroundColor(.white))
                            }
                        }
                    )
                Text(game.name)
                    .font(AppFont.body())
                    .foregroundColor(.primary)
            }
            .frame(width: 160, height: 160)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.AppColor.background))
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Mini Game \(game.name)")
        .sheet(isPresented: $showGame) {
            MiniGamePlaceholderView(name: game.name)
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    MiniGameTileView(game: MiniGame.demoGames[0])
}
#endif
