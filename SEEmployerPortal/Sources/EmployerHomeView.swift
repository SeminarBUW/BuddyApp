// swiftlint:disable all
import SwiftUI
import DesignSystem
import SETandemCore

// MARK: - EmployerHomeView

/// Overview of employer tandems and entry to documents.
public struct EmployerHomeView: View {
    @State private var tandems: [EmployerTandem] = EmployerDemoData.tandems
    @State private var showDocs = false
    @State private var selectedTandem: EmployerTandem?

    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                header
                ForEach(tandems) { tandem in
                    row(for: tandem)
                        .swipeActions {
                            if tandem.progress >= 1.0 {
                                Button("Archivieren") {
                                    archive(tandem)
                                }.tint(.red)
                            }
                        }
                }
            }
            .navigationTitle("Meine Tandems")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dokumente") { showDocs = true }
                        .accessibilityLabel("Dokumente öffnen")
                }
            }
            .navigationDestination(isPresented: $showDocs) {
                EmployerDocManagerView()
            }
            .sheet(item: $selectedTandem) { tandem in
                NavigationStack { TandemStatusView(tandem: tandem) }
            }
        }
    }

    private var header: some View {
        HStack {
            Text("Meine Tandems")
                .font(AppFont.title())
            Spacer()
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)
                .overlay(Text("Logo"))
        }
        .padding(.vertical, Spacing.sm)
    }

    private func row(for tandem: EmployerTandem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(tandem.participantName) & \(tandem.buddyName)")
                    .font(AppFont.body())
                Button("Status") { selectedTandem = tandem }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.AppColor.accent)
            }
            Spacer()
            ProgressView(value: tandem.progress)
                .progressViewStyle(.circular)
                .tint(Color.AppColor.primary400)
                .frame(width: 30, height: 30)
        }
        .accessibilityLabel("Tandem \(tandem.participantName) Fortschritt \(Int(tandem.progress * 100)) Prozent")
    }

    private func archive(_ tandem: EmployerTandem) {
        tandems.removeAll { $0.id == tandem.id }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    EmployerHomeView()
}
#endif
