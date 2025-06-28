// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Mini Game Placeholder

struct MiniGamePlaceholderView: View {
    let name: String

    var body: some View {
        VStack {
            Text("\(name) kommt bald …")
                .font(AppFont.subtitle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.AppColor.background)
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    MiniGamePlaceholderView(name: "Quiz")
}
#endif
