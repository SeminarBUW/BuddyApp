// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - TandemAdminView

/// Manage tandems within the agency.
public struct TandemAdminView: View {
    @State private var tandems: [TandemSummary]
    @State private var showCreate = false

    public init(tandems: [TandemSummary] = AgencyDemoData.tandems) {
        _tandems = State(initialValue: tandems)
    }

    public var body: some View {
        List {
            ForEach(tandems) { tandem in
                TandemRow(tandem: tandem)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        if tandem.status == .pending {
                            Button(role: .destructive) {
                                tandems.removeAll { $0.id == tandem.id }
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                        }
                    }
            }
        }
        .navigationTitle("Tandem-Verwaltung")
        .toolbar {
            Button {
                showCreate = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showCreate) { TandemCreateView(tandems: $tandems) }
    }
}

private struct TandemRow: View {
    var tandem: TandemSummary

    var badgeColor: Color {
        switch tandem.status {
        case .active: return Color.AppColor.accent
        case .completed: return Color.AppColor.primary400
        case .pending: return Color.AppColor.primary200
        }
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(tandem.participantName) & \(tandem.buddyName)")
                    .font(AppFont.body())
                Text(tandem.status.rawValue.capitalized)
                    .font(AppFont.caption())
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 6).fill(badgeColor))
                    .foregroundColor(.white)
            }
            Spacer()
            ProgressView(value: tandem.progress)
                .frame(width: 30)
                .tint(Color.AppColor.accent)
        }
        .accessibilityLabel("Tandem \(tandem.participantName) und \(tandem.buddyName)")
    }
}

private struct TandemCreateView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tandems: [TandemSummary]
    @State private var participant = ""
    @State private var buddy = ""
    @State private var startDate = Date()
    @State private var branch = "Gastronomie"

    var body: some View {
        NavigationStack {
            Form {
                TextField("Teilnehmer", text: $participant)
                TextField("Buddy", text: $buddy)
                DatePicker("Start", selection: $startDate, displayedComponents: .date)
                Picker("Branche", selection: $branch) {
                    Text("Gastronomie").tag("Gastronomie")
                    Text("Handwerk").tag("Handwerk")
                }
            }
            .navigationTitle("Neues Tandem")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Abbrechen") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Speichern") {
                        tandems.append(TandemSummary(participantName: participant, buddyName: buddy, progress: 0, status: .pending))
                        dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack { TandemAdminView() }
}
#endif
