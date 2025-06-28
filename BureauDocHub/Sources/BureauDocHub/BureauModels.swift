// swiftlint:disable all
import Foundation

// MARK: - Models

/// Represents a bureaucratic document.
public struct BureauDoc: Identifiable {
    public enum Category: String, CaseIterable {
        case visa, arbeitsamt, other
    }

    public enum Status: String, CaseIterable {
        case todo, inProgress, done
    }

    public let id: UUID
    public var title: String
    public var category: Category
    public var status: Status
    public var updatedAt: Date

    public init(id: UUID = UUID(), title: String, category: Category, status: Status, updatedAt: Date = Date()) {
        self.id = id
        self.title = title
        self.category = category
        self.status = status
        self.updatedAt = updatedAt
    }
}

/// Field types for a form step.
public enum FormFieldType {
    case text
    case date
    case choice
}

/// Single form input field.
public struct FormField: Identifiable {
    public let id: UUID
    public var label: String
    public var type: FormFieldType
    public var value: String?

    public init(id: UUID = UUID(), label: String, type: FormFieldType, value: String? = nil) {
        self.id = id
        self.label = label
        self.type = type
        self.value = value
    }
}

/// Represents a step in a form wizard.
public struct FormStep: Identifiable {
    public let id: UUID
    public var title: String
    public var fields: [FormField]

    public init(id: UUID = UUID(), title: String, fields: [FormField]) {
        self.id = id
        self.title = title
        self.fields = fields
    }
}

// MARK: - Demo Data
public enum BureauDemoData {
    public static let docs: [BureauDoc] = [
        BureauDoc(title: "Pass beantragen", category: .visa, status: .todo),
        BureauDoc(title: "Arbeitserlaubnis", category: .arbeitsamt, status: .inProgress),
        BureauDoc(title: "Meldebescheinigung", category: .visa, status: .done),
        BureauDoc(title: "Kindergeld", category: .arbeitsamt, status: .todo),
        BureauDoc(title: "Wohnberechtigung", category: .other, status: .todo),
        BureauDoc(title: "Steuer-ID", category: .other, status: .done),
        BureauDoc(title: "Sozialversicherung", category: .arbeitsamt, status: .inProgress),
        BureauDoc(title: "Führungszeugnis", category: .visa, status: .todo)
    ]

    public static let formSteps: [FormStep] = [
        FormStep(title: "Persönlich", fields: [
            FormField(label: "Name", type: .text),
            FormField(label: "Geburtsdatum", type: .date)
        ]),
        FormStep(title: "Details", fields: [
            FormField(label: "Status", type: .choice),
            FormField(label: "Kommentar", type: .text)
        ])
    ]
}

// MARK: - Helpers
/// Marks the given document as done within the array.
public func markDocDone(_ doc: BureauDoc, in docs: inout [BureauDoc]) {
    if let index = docs.firstIndex(where: { $0.id == doc.id }) {
        docs[index].status = .done
    }
}
