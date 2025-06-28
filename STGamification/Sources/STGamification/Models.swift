// swiftlint:disable all
import Foundation

// MARK: - DailyTask

/// Represents a task users can complete each day.
public struct DailyTask: Identifiable, Hashable {
    public var id: UUID
    public var title: String
    public var isCompleted: Bool
    public var xp: Int

    public init(id: UUID = UUID(), title: String, isCompleted: Bool = false, xp: Int) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.xp = xp
    }
}

// MARK: - MiniGame

/// Represents a mini game available to play.
public struct MiniGame: Identifiable, Hashable {
    public var id: UUID
    public var name: String
    public var iconName: String
    public var description: String
    public var isUnlocked: Bool

    public init(id: UUID = UUID(), name: String, iconName: String, description: String, isUnlocked: Bool = true) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.description = description
        self.isUnlocked = isUnlocked
    }
}

// MARK: - Demo Data

extension DailyTask {
    /// Seven demo tasks used in previews and testing.
    public static let demoTasks: [DailyTask] = [
        DailyTask(title: "Hörübung", xp: 10),
        DailyTask(title: "Vokabeln wiederholen", xp: 15),
        DailyTask(title: "Grammatik", xp: 20),
        DailyTask(title: "Sprechen", xp: 10),
        DailyTask(title: "Schreiben", xp: 15),
        DailyTask(title: "Quiz", xp: 20),
        DailyTask(title: "Aussprache", xp: 10)
    ]
}

extension MiniGame {
    /// Demo games for the hub.
    public static let demoGames: [MiniGame] = [
        MiniGame(name: "Puzzle", iconName: "puzzlepiece", description: "Ordne die Wörter"),
        MiniGame(name: "Quiz", iconName: "questionmark.circle", description: "Schnelles Quiz"),
        MiniGame(name: "Hangman", iconName: "gamecontroller", description: "Errate das Wort", isUnlocked: false)
    ]
}
