// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - DocDetailView

/// Shows a single document with actions.
public struct DocDetailView: View {
    @Binding var doc: BureauDoc
    @State private var showWizard = false

    public init(doc: Binding<BureauDoc>) {
        self._doc = doc
    }

    public var body: some View {
        Form {
            Section {
                Text(doc.title).font(AppFont.subtitle())
                HStack {
                    Text(doc.category.rawValue.capitalized)
                        .padding(4)
                        .background(Color.AppColor.primary200)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    Spacer()
                    Picker("Status", selection: $doc.status) {
                        ForEach(BureauDoc.Status.allCases, id: \._self) { status in
                            Text(status.rawValue)
                        }
                    }
                }
            }
            if doc.status != .done {
                Button("Formular ausfüllen") { showWizard = true }
                    .accessibilityLabel("Formular öffnen")
            }
        }
        .navigationTitle(doc.title)
        .sheet(isPresented: $showWizard) {
            FormWizardView(steps: BureauDemoData.formSteps, doc: $doc)
        }
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    NavigationStack {
        DocDetailView(doc: .constant(BureauDemoData.docs[0]))
    }
}
#endif
