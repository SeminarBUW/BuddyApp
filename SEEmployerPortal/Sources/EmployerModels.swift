// swiftlint:disable all
import Foundation

// MARK: - EmployerTandem

/// Represents a tandem entry for employers.
public struct EmployerTandem: Identifiable, Hashable {
    public var id: UUID
    public var participantName: String
    public var buddyName: String
    public var progress: Double
    public var lastUpdate: Date

    public init(id: UUID = UUID(), participantName: String, buddyName: String, progress: Double = 0, lastUpdate: Date = Date()) {
        self.id = id
        self.participantName = participantName
        self.buddyName = buddyName
        self.progress = progress
        self.lastUpdate = lastUpdate
    }
}

// MARK: - EmployerDoc

/// Document provided for employers.
public struct EmployerDoc: Identifiable, Hashable {
    public var id: UUID
    public var title: String
    public var fileURL: URL
    public var updatedAt: Date

    public init(id: UUID = UUID(), title: String, fileURL: URL, updatedAt: Date = Date()) {
        self.id = id
        self.title = title
        self.fileURL = fileURL
        self.updatedAt = updatedAt
    }
}

// MARK: - Demo Data

public enum EmployerDemoData {
    public static let tandems: [EmployerTandem] = [
        EmployerTandem(participantName: "Ali", buddyName: "Ben", progress: 0.7, lastUpdate: Date().addingTimeInterval(-86400 * 3)),
        EmployerTandem(participantName: "Sara", buddyName: "Lena", progress: 1.0, lastUpdate: Date().addingTimeInterval(-86400 * 30)),
        EmployerTandem(participantName: "Omar", buddyName: "Max", progress: 0.4, lastUpdate: Date().addingTimeInterval(-86400 * 7)),
        EmployerTandem(participantName: "Mina", buddyName: "Tom", progress: 0.9, lastUpdate: Date().addingTimeInterval(-86400 * 1)),
        EmployerTandem(participantName: "Nora", buddyName: "Anna", progress: 0.2, lastUpdate: Date().addingTimeInterval(-86400 * 2))
    ]

    public static let docs: [EmployerDoc] = [
        EmployerDoc(title: "Vertrag", fileURL: URL(string: "https://example.com/doc1.pdf")!, updatedAt: Date().addingTimeInterval(-86400 * 5)),
        EmployerDoc(title: "Leitfaden", fileURL: URL(string: "https://example.com/doc2.pdf")!, updatedAt: Date().addingTimeInterval(-86400 * 10)),
        EmployerDoc(title: "Checkliste", fileURL: URL(string: "https://example.com/doc3.pdf")!, updatedAt: Date().addingTimeInterval(-86400 * 20)),
        EmployerDoc(title: "Zertifikat", fileURL: URL(string: "https://example.com/doc4.pdf")!, updatedAt: Date().addingTimeInterval(-86400 * 1))
    ]
}
