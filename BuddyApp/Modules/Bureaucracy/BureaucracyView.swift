import SwiftUI

struct BureaucracyView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Dokumente & Formulare") {
                    Text("Dokumenten-Center Placeholder")
                        .padding()
                }
                NavigationLink("Einbürgerungs-Fortschritt") {
                    Text("Fortschritt Placeholder")
                        .padding()
                }
            }
            .navigationTitle("Bürokratie")
        }
    }
}

#Preview {
    BureaucracyView()
}
