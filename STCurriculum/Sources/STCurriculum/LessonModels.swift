// swiftlint:disable all
import Foundation

// MARK: - LessonSection

/// Represents a single section within a lesson.
public struct LessonSection: Identifiable, Hashable {
    public var id: UUID
    public var title: String
    public var content: String
    public var audioURL: URL?

    public init(id: UUID = UUID(), title: String, content: String, audioURL: URL? = nil) {
        self.id = id
        self.title = title
        self.content = content
        self.audioURL = audioURL
    }
}

// MARK: - Lesson

/// A full lesson containing multiple sections.
public struct Lesson: Identifiable, Hashable {
    public var id: UUID
    public var title: String
    public var level: String
    public var thumbnailName: String
    public var progress: Double
    public var sections: [LessonSection]

    public init(id: UUID = UUID(),
                title: String,
                level: String,
                thumbnailName: String,
                progress: Double = 0,
                sections: [LessonSection]) {
        self.id = id
        self.title = title
        self.level = level
        self.thumbnailName = thumbnailName
        self.progress = progress
        self.sections = sections
    }
}

// MARK: - Mock Data

extension Lesson {
    /// Demo lessons for previews and tests.
    public static func mockData() -> [Lesson] {
        let sectionsA: [LessonSection] = [
            LessonSection(title: "Einführung", content: "Willkommen zur Lektion."),
            LessonSection(title: "Dialog", content: "Hallo! Wie geht es dir?"),
            LessonSection(title: "Übung", content: "Antworten Sie schriftlich.")
        ]
        let sectionsB: [LessonSection] = [
            LessonSection(title: "Überblick", content: "Kaufe Obst und Gemüse."),
            LessonSection(title: "Vokabeln", content: "Apfel, Birne, Orange."),
            LessonSection(title: "Quiz", content: "Was kostet ein Kilo Äpfel?")
        ]
        let sectionsC: [LessonSection] = [
            LessonSection(title: "Arbeitsplatz", content: "Kommunikation im Büro."),
            LessonSection(title: "Grammatik", content: "Verbkonjugation"),
            LessonSection(title: "Übung", content: "Schreiben Sie eine E-Mail."),
            LessonSection(title: "Zusammenfassung", content: "Wiederholung")
        ]

        return [
            Lesson(title: "Begrüßung", level: "A1", thumbnailName: "lesson1", sections: sectionsA),
            Lesson(title: "Einkaufen", level: "A1", thumbnailName: "lesson2", sections: sectionsB),
            Lesson(title: "Arbeit", level: "A2", thumbnailName: "lesson3", sections: sectionsC),
            Lesson(title: "Freizeit", level: "A2", thumbnailName: "lesson4", sections: sectionsA),
            Lesson(title: "Bewerbung", level: "B1", thumbnailName: "lesson5", sections: sectionsB),
            Lesson(title: "Telefonieren", level: "B1", thumbnailName: "lesson6", sections: sectionsC)
        ]
    }
}

// MARK: - Filtering

/// Filters lessons by search query in title or level.
func filterLessons(_ lessons: [Lesson], query: String) -> [Lesson] {
    guard !query.isEmpty else { return lessons }
    return lessons.filter { lesson in
        lesson.title.localizedCaseInsensitiveContains(query) ||
        lesson.level.localizedCaseInsensitiveContains(query)
    }
}
