// swiftlint:disable all
import Foundation

// MARK: - Demo Data

enum TandemDemoData {
    static let quests: [Quest] = [
        Quest(title: "Begrüßungsdialog üben", type: .daily, xp: 10),
        Quest(title: "Vokabeln wiederholen", type: .daily, xp: 10),
        Quest(title: "Kurzen Tagebucheintrag", type: .daily, xp: 5),
        Quest(title: "Sprachaufgabe abschließen", type: .daily, xp: 15),
        Quest(title: "Wochen-Challenge: Präsentation", type: .weekly, xp: 30)
    ]

    static let diaryEntries: [DiaryEntry] = [
        DiaryEntry(mood: "😀", notes: "Guter erster Arbeitstag"),
        DiaryEntry(mood: "🙂", notes: "Neue Wörter gelernt"),
        DiaryEntry(mood: "😐", notes: "Etwas müde"),
        DiaryEntry(mood: "🙁", notes: "Schwierige Übung"),
        DiaryEntry(mood: "😀", notes: "Tandempartner getroffen"),
        DiaryEntry(mood: "🙂", notes: "Viel geübt"),
        DiaryEntry(mood: "😢", notes: "Heimweh")
    ]

    static let glossary: [GlossaryItem] = [
        GlossaryItem(term: "Bewerbung", translation: "Application", imageName: "doc.text"),
        GlossaryItem(term: "Arbeitsvertrag", translation: "Employment contract", imageName: "briefcase"),
        GlossaryItem(term: "Werkzeug", translation: "Tool", imageName: "hammer"),
        GlossaryItem(term: "Pause", translation: "Break"),
        GlossaryItem(term: "Lohn", translation: "Salary"),
        GlossaryItem(term: "Kunde", translation: "Customer"),
        GlossaryItem(term: "Team", translation: "Team"),
        GlossaryItem(term: "Bericht", translation: "Report"),
        GlossaryItem(term: "Termin", translation: "Appointment"),
        GlossaryItem(term: "Projekt", translation: "Project")
    ]
}
