// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - GlossaryView

/// Displays glossary items with search and add functionality.
public struct GlossaryView: View {
    @State private var items: [GlossaryItem]
    @State private var query: String = ""
    @State private var showAdd = false

    public init(items: [GlossaryItem] = TandemDemoData.glossary) {
        _items = State(initialValue: items)
    }

    private var filtered: [GlossaryItem] {
        if query.isEmpty { return items }
        return items.filter { $0.term.localizedCaseInsensitiveContains(query) || $0.translation.localizedCaseInsensitiveContains(query) }
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: Spacing.md) {
                ForEach(filtered) { item in
                    GlossaryTileView(item: item)
                }
            }
            .padding(Spacing.md)
        }
        .navigationTitle("Glossar")
        .searchable(text: $query)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showAdd = true }) { Image(systemName: "plus") }
                    .accessibilityLabel("Begriff hinzufügen")
            }
        }
        .sheet(isPresented: $showAdd) {
            GlossaryAddView { newItem in
                items.append(newItem)
            }
        }
    }
}

private struct GlossaryTileView: View {
    var item: GlossaryItem

    var body: some View {
        VStack {
            if let name = item.imageName {
                Image(systemName: name)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
            } else {
                Rectangle()
                    .fill(Color.AppColor.primary200)
                    .frame(height: 60)
            }
            Text(item.term)
                .font(AppFont.subtitle())
                .foregroundColor(.white)
            Text(item.translation)
                .font(AppFont.caption())
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 160)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.AppColor.primary400))
        .accessibilityLabel("\(item.term) \(item.translation)")
    }
}

private struct GlossaryAddView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var term: String = ""
    @State private var translation: String = ""
    @State private var imageName: String = ""
    var onAdd: (GlossaryItem) -> Void

    var body: some View {
        NavigationStack {
            Form {
                TextField("Begriff", text: $term)
                TextField("Übersetzung", text: $translation)
                TextField("Bildname (SF Symbol)", text: $imageName)
                Text("ImagePicker kommt…")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Begriff hinzufügen")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        onAdd(GlossaryItem(term: term, translation: translation, imageName: imageName.isEmpty ? nil : imageName))
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) { Button("Abbrechen", action: { dismiss() }) }
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { GlossaryView() }
}
#endif
