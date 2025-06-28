// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - DocHomeView

/// Home view listing documents and entry to the scanner.
public struct DocHomeView: View {
    @State private var docs: [BureauDoc] = BureauDemoData.docs
    @State private var selectedCategory: BureauDoc.Category? = nil
    @State private var showScanner = false

    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                ForEach(BureauDoc.Status.allCases, id: \._self) { status in
                    Section(statusTitle(status)) {
                        ForEach(filteredDocs.filter { $0.status == status }) { doc in
                            NavigationLink(destination: DocDetailView(doc: binding(for: doc))) {
                                DocRowView(doc: doc)
                            }
                            .swipeActions {
                                if doc.status != .done {
                                    Button("Als erledigt") {
                                        markDone(doc)
                                    }.tint(.green)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Dokumente & Formulare")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Scan/Upload") { showScanner = true }
                        .accessibilityLabel("Dokument scannen oder hochladen")
                }
            }
            .sheet(isPresented: $showScanner) { DocScannerStubView(docs: $docs) }
            .safeAreaInset(edge: .top) {
                Picker("Kategorie", selection: $selectedCategory) {
                    Text("Alle").tag(BureauDoc.Category?.none)
                    ForEach(BureauDoc.Category.allCases, id: \._self) { cat in
                        Text(cat.rawValue.capitalized).tag(BureauDoc.Category?.some(cat))
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
            }
        }
    }

    private var filteredDocs: [BureauDoc] {
        if let category = selectedCategory {
            return docs.filter { $0.category == category }
        }
        return docs
    }

    private func binding(for doc: BureauDoc) -> Binding<BureauDoc> {
        guard let index = docs.firstIndex(where: { $0.id == doc.id }) else {
            return .constant(doc)
        }
        return $docs[index]
    }

    func markDone(_ doc: BureauDoc) {
        markDocDone(doc, in: &docs)
}

    private func statusTitle(_ status: BureauDoc.Status) -> String {
        switch status {
        case .todo: return "To-Do"
        case .inProgress: return "In Bearbeitung"
        case .done: return "Erledigt"
        }
    }
}

private struct DocRowView: View {
    let doc: BureauDoc

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(doc.title)
                    .font(AppFont.body())
                Text(doc.category.rawValue.capitalized)
                    .font(AppFont.caption())
                    .padding(4)
                    .background(Color.AppColor.primary200)
                    .foregroundColor(.white)
                    .cornerRadius(6)
            }
            Spacer()
            Text(doc.updatedAt, style: .date)
                .font(AppFont.caption())
        }
        .accessibilityLabel("Dokument \(doc.title) Status \(doc.status.rawValue)")
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    DocHomeView()
}
#endif
