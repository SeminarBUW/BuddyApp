// swiftlint:disable all
import Foundation

// MARK: - TandemSummary

/// Represents a tandem overview for agency admins.
public struct TandemSummary: Identifiable, Hashable {
    public enum Status: String, CaseIterable {
        case active, completed, pending
    }

    public var id: UUID
    public var participantName: String
    public var buddyName: String
    public var progress: Double
    public var status: Status

    public init(id: UUID = UUID(), participantName: String, buddyName: String, progress: Double = 0, status: Status = .pending) {
        self.id = id
        self.participantName = participantName
        self.buddyName = buddyName
        self.progress = progress
        self.status = status
    }
}

// MARK: - Certificate

/// Certificate associated with a tandem.
public struct Certificate: Identifiable, Hashable {
    public var id: UUID
    public var tandemId: UUID
    public var issuedAt: Date
    public var pdfURL: URL

    public init(id: UUID = UUID(), tandemId: UUID, issuedAt: Date, pdfURL: URL) {
        self.id = id
        self.tandemId = tandemId
        self.issuedAt = issuedAt
        self.pdfURL = pdfURL
    }
}

// MARK: - Demo Data

public enum AgencyDemoData {
    public static let tandems: [TandemSummary] = [
        TandemSummary(participantName: "Ali", buddyName: "Ben", progress: 0.2, status: .active),
        TandemSummary(participantName: "Sara", buddyName: "Lena", progress: 0.8, status: .completed),
        TandemSummary(participantName: "Omar", buddyName: "Max", progress: 0.1, status: .pending),
        TandemSummary(participantName: "Mina", buddyName: "Tom", progress: 0.5, status: .active),
        TandemSummary(participantName: "Nora", buddyName: "Anna", progress: 0.0, status: .pending),
        TandemSummary(participantName: "Leo", buddyName: "Sara", progress: 1.0, status: .completed)
    ]

    public static let certificates: [Certificate] = [
        Certificate(tandemId: tandems[1].id, issuedAt: Date().addingTimeInterval(-86400 * 30), pdfURL: URL(string: "https://example.com/cert1.pdf")!),
        Certificate(tandemId: tandems[5].id, issuedAt: Date().addingTimeInterval(-86400 * 10), pdfURL: URL(string: "https://example.com/cert2.pdf")!),
        Certificate(tandemId: tandems[1].id, issuedAt: Date(), pdfURL: URL(string: "https://example.com/cert3.pdf")!)
    ]
}
