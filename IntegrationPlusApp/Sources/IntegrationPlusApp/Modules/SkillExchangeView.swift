import SwiftUI

struct SkillExchangeView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Meine Quests / Tagebuch") {
                    Text("Tandem-Quests Placeholder")
                        .padding()
                }
                NavigationLink("Tandem-Verwaltung") {
                    Text("Agentur Dashboard Placeholder")
                        .padding()
                }
                NavigationLink("Tandems & Feedback") {
                    Text("Arbeitgeber Übersicht Placeholder")
                        .padding()
                }
            }
            .navigationTitle("Skill Exchange")
        }
    }
}

#Preview {
    SkillExchangeView()
}
