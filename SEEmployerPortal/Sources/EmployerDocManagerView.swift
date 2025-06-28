// swiftlint:disable all
import SwiftUI
import DesignSystem
import PDFKit

// MARK: - DocCardView

private struct DocCardView: View {
    var doc: EmployerDoc
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: "doc.text")
                    .font(.largeTitle)
                Text(doc.title)
                    .font(AppFont.caption())
                    .multilineTextAlignment(.center)
                Text(doc.updatedAt, style: .date)
                    .font(AppFont.caption())
            }
            .frame(maxWidth: .infinity, minHeight: 120)
            .padding(Spacing.sm)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.AppColor.primary200))
            .foregroundColor(.white)
            .accessibilityLabel(doc.title)
        }
    }
}

// MARK: - EmployerDocManagerView

/// Displays and opens employer documents.
public struct EmployerDocManagerView: View {
    @State private var docs: [EmployerDoc] = EmployerDemoData.docs
    @State private var selectedDoc: EmployerDoc?

    public init() {}

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: Spacing.md) {
                ForEach(docs) { doc in
                    DocCardView(doc: doc) { selectedDoc = doc }
                }
            }
            .padding(Spacing.md)
        }
        .refreshable { refresh() }
        .sheet(item: $selectedDoc) { doc in
            PDFPreviewView(url: doc.fileURL)
        }
    }

    private func refresh() {
        docs = docs.map { doc in
            var d = doc
            d.updatedAt = Date()
            return d
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    EmployerDocManagerView()
}
#endif
