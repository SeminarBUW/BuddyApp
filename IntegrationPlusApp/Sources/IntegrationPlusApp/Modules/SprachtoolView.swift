import SwiftUI

struct SprachtoolView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Kursbegleitung") {
                    CourseGuideView()
                }
                NavigationLink("Mein Vokabelheft") {
                    VocabularyView()
                }
                NavigationLink("Tägliche Aufgaben & Spiele") {
                    DailyTasksView()
                }
            }
            .navigationTitle("Sprachtool")
        }
    }
}

struct CourseGuideView: View {
    var body: some View {
        Text("Kursbegleitung Inhalt")
            .padding()
    }
}

struct VocabularyView: View {
    var body: some View {
        Text("Vokabelheft Platzhalter")
            .padding()
    }
}

struct DailyTasksView: View {
    var body: some View {
        Text("Tägliche Aufgaben Platzhalter")
            .padding()
    }
}

#Preview {
    SprachtoolView()
}
