// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - DocScannerStubView

/// Placeholder scanner view.
public struct DocScannerStubView: View {
    @Binding var docs: [BureauDoc]
    @Environment(\.dismiss) private var dismiss

    public init(docs: Binding<[BureauDoc]>) {
        self._docs = docs
    }

    public var body: some View {
        VStack(spacing: Spacing.md) {
            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.AppColor.primary400)
            Text("Scanner kommt bald …")
                .font(AppFont.subtitle())
            Button("Dummy-PDF hinzufügen") {
                let new = BureauDoc(title: "Dummy-PDF", category: .other, status: .inProgress)
                docs.append(new)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.AppColor.accent)
            .accessibilityLabel("Dummy PDF hinzufügen")
        }
        .padding()
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    DocScannerStubView(docs: .constant(BureauDemoData.docs))
}
#endif
