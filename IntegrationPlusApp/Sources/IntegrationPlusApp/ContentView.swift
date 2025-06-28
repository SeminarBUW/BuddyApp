import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SprachtoolView()
                .tabItem {
                    Label("Sprachtool", systemImage: "book")
                }
            SkillExchangeView()
                .tabItem {
                    Label("Skill", systemImage: "person.2.fill")
                }
            BureaucracyView()
                .tabItem {
                    Label("Bürokratie", systemImage: "doc.text")
                }
        }
    }
}

#Preview {
    ContentView()
}
