// swiftlint:disable all
import SwiftUI
import DesignSystem

// MARK: - Entry

/// Root Sprachtool overview with link into the course list.
public struct SprachtoolOverviewView: View {
    public init() {}

    public var body: some View {
        NavigationLink("Kurse ansehen") {
            CourseListView()
        }
        .padding()
    }
}

#if DEBUG
#Preview {
    NavigationStack { SprachtoolOverviewView() }
}
#endif
