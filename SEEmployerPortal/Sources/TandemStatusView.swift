// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Feedback Model

struct Feedback: Identifiable {
    var id = UUID()
    var rating: Int
    var comment: String
    var date: Date = Date()
}

final class FeedbackManager: ObservableObject {
    @Published private(set) var feedbacks: [Feedback] = []

    func save(rating: Int, comment: String) {
        feedbacks.append(Feedback(rating: rating, comment: comment))
    }
}

// MARK: - TandemStatusView

/// Shows status and allows sending feedback.
public struct TandemStatusView: View {
    public var tandem: EmployerTandem
    @State private var rating: Int = 3
    @State private var comment: String = ""
    @State private var showThanks = false
    @StateObject private var store = FeedbackManager()

    public init(tandem: EmployerTandem) {
        self.tandem = tandem
    }

    public var body: some View {
        VStack(spacing: Spacing.md) {
            Text("\(tandem.participantName) & \(tandem.buddyName)")
                .font(AppFont.subtitle())
            ProgressView(value: tandem.progress)
                .tint(Color.AppColor.accent)
            Text("Letztes Update: \(tandem.lastUpdate.formatted(.dateTime.day().month().year()))")
                .font(AppFont.caption())
            ratingStars
            TextField("Feedback", text: $comment)
                .textFieldStyle(.roundedBorder)
            Button("Senden") {
                store.save(rating: rating, comment: comment)
                comment = ""
                showThanks = true
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.AppColor.accent)
            Spacer()
        }
        .padding(Spacing.md)
        .toast(isPresented: $showThanks) {
            Text("Danke für Ihr Feedback")
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.AppColor.primary200))
        }
    }

    private var ratingStars: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: index <= rating ? "star.fill" : "star")
                    .foregroundColor(Color.AppColor.accent)
                    .onTapGesture { rating = index }
                    .accessibilityLabel("Stern \(index)")
            }
        }
    }
}

// MARK: - Toast Modifier

private extension View {
    func toast(isPresented: Binding<Bool>, content: @escaping () -> some View) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                content()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isPresented.wrappedValue = false
                        }
                    }
                    .transition(.opacity)
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    TandemStatusView(tandem: EmployerDemoData.tandems[0])
}
#endif
