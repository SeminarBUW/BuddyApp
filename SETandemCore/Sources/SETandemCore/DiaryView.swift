// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - DiaryView

/// Shows diary entries and allows creating new ones.
public struct DiaryView: View {
    @State private var entries: [DiaryEntry]
    @State private var showEdit = false

    public init(entries: [DiaryEntry] = TandemDemoData.diaryEntries) {
        _entries = State(initialValue: entries)
    }

    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {
                ForEach(entries.sorted(by: { $0.date > $1.date })) { entry in
                    DiaryEntryRowView(entry: entry)
                }
                .onDelete { indexSet in
                    entries.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Tagebuch")

            Button(action: { showEdit = true }) {
                Image(systemName: "plus")
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(Color.AppColor.accent))
                    .foregroundColor(.white)
                    .shadow(radius: 4)
            }
            .padding()
            .accessibilityLabel("Eintrag hinzufügen")
        }
        .sheet(isPresented: $showEdit) {
            DiaryEditView { newEntry in
                entries.append(newEntry)
            }
        }
    }
}

private struct DiaryEntryRowView: View {
    var entry: DiaryEntry

    var body: some View {
        HStack {
            Text(entry.mood)
            VStack(alignment: .leading) {
                Text(entry.date, style: .date)
                    .font(AppFont.caption())
                Text(entry.notes)
                    .font(AppFont.body())
            }
        }
        .accessibilityLabel("Eintrag am \(entry.date.formatted(date: .abbreviated, time: .omitted))")
    }
}

private struct DiaryEditView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var mood: String = "😀"
    @State private var notes: String = ""
    var onSave: (DiaryEntry) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Picker("Stimmung", selection: $mood) {
                    Text("😀").tag("😀")
                    Text("🙂").tag("🙂")
                    Text("😐").tag("😐")
                    Text("🙁").tag("🙁")
                    Text("😢").tag("😢")
                }
                TextField("Notizen", text: $notes)
            }
            .navigationTitle("Eintrag")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        onSave(DiaryEntry(mood: mood, notes: notes))
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Abbrechen", action: { dismiss() })
                }
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { DiaryView() }
}
#endif
