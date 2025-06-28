// swiftlint:disable all
import Foundation

// MARK: - Quest

/// Represents a daily or weekly quest.
public struct Quest: Identifiable, Hashable {
    public enum `Type`: String {
        case daily
        case weekly
    }

    public var id: UUID
    public var title: String
    public var type: Type
    public var xp: Int
    public var isCompleted: Bool

    public init(id: UUID = UUID(), title: String, type: Type, xp: Int, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.type = type
        self.xp = xp
        self.isCompleted = isCompleted
    }
}

// MARK: - DiaryEntry

/// Represents a diary entry written by the user.
public struct DiaryEntry: Identifiable, Hashable {
    public var id: UUID
    public var date: Date
    public var mood: String
    public var notes: String

    public init(id: UUID = UUID(), date: Date = Date(), mood: String, notes: String) {
        self.id = id
        self.date = date
        self.mood = mood
        self.notes = notes
    }
}

// MARK: - GlossaryItem

/// Represents a glossary item with optional image.
public struct GlossaryItem: Identifiable, Hashable {
    public var id: UUID
    public var term: String
    public var translation: String
    public var imageName: String?

    public init(id: UUID = UUID(), term: String, translation: String, imageName: String? = nil) {
        self.id = id
        self.term = term
        self.translation = translation
        self.imageName = imageName
    }
}
