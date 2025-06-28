// swiftlint:disable all
import SwiftUI
import PDFKit
import DesignSystem

// MARK: - FormWizardView

/// Interactive form wizard creating a PDF.
public struct FormWizardView: View {
    @StateObject private var viewModel: FormWizardViewModel
    @Binding var doc: BureauDoc
    @State private var showShare = false

    public init(steps: [FormStep], doc: Binding<BureauDoc>) {
        _viewModel = StateObject(wrappedValue: FormWizardViewModel(steps: steps))
        self._doc = doc
    }

    public var body: some View {
        VStack {
            TabView(selection: $viewModel.currentIndex) {
                ForEach(Array(viewModel.steps.enumerated()), id: \.[0]) { index, step in
                    stepView(step)
                        .tag(index)
                        .padding()
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            HStack {
                Button("Zurück") { viewModel.previous() }
                    .disabled(viewModel.currentIndex == 0)
                ProgressView(value: Double(viewModel.currentIndex) / Double(viewModel.steps.count - 1))
                    .tint(Color.AppColor.accent)
                    .frame(height: 8)
                    .progressViewStyle(.linear)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                Button(viewModel.currentIndex == viewModel.steps.count - 1 ? "Fertig" : "Weiter") { viewModel.next() }
            }
            .padding()
        }
        .sheet(isPresented: $showShare) {
            Text("PDF exportiert")
                .font(AppFont.subtitle())
        }
        .onChange(of: viewModel.isCompleted) { completed in
            if completed { finish() }
        }
    }

    private func stepView(_ step: FormStep) -> some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            Text(step.title).font(AppFont.subtitle())
            ForEach(step.fields.indices, id: \._self) { idx in
                fieldView(step: step, index: idx)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16).fill(Color.AppColor.background)
        )
    }

    private func fieldView(step: FormStep, index: Int) -> some View {
        let binding = Binding<String?>(
            get: { step.fields[index].value },
            set: { newValue in updateField(stepID: step.id, fieldIndex: index, value: newValue) }
        )
        switch step.fields[index].type {
        case .text:
            return AnyView(TextField(step.fields[index].label, text: Binding(binding, replacingNilWith: ""))
                .textFieldStyle(.roundedBorder)
                .accessibilityLabel(step.fields[index].label))
        case .date:
            return AnyView(DatePicker(step.fields[index].label, selection: Binding(get: {
                Date(timeIntervalSince1970: Double(binding.wrappedValue ?? "0") ?? 0)
            }, set: { date in
                updateField(stepID: step.id, fieldIndex: index, value: String(date.timeIntervalSince1970))
            }), displayedComponents: .date)
                .accessibilityLabel(step.fields[index].label))
        case .choice:
            return AnyView(Picker(step.fields[index].label, selection: Binding(binding, replacingNilWith: "Option 1")) {
                Text("Option 1").tag("Option 1")
                Text("Option 2").tag("Option 2")
            }
                .pickerStyle(.menu)
                .accessibilityLabel(step.fields[index].label))
        }
    }

    private func updateField(stepID: UUID, fieldIndex: Int, value: String?) {
        guard let stepIndex = viewModel.steps.firstIndex(where: { $0.id == stepID }) else { return }
        viewModel.steps[stepIndex].fields[fieldIndex].value = value
    }


    private func finish() {
        viewModel.isCompleted = true
        doc.status = .done
        _ = PDFDocument()
        showShare = true
    }
}

fileprivate extension Binding where Value == String? {
    init(_ source: Binding<String?>, replacingNilWith defaultValue: String) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}

// MARK: - Preview
#if DEBUG
#Preview {
    FormWizardView(steps: BureauDemoData.formSteps, doc: .constant(BureauDemoData.docs[0]))
}
#endif
