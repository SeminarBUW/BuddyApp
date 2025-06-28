#if canImport(WidgetKit)
import WidgetKit
import SwiftUI
import DesignSystem

// MARK: - ProgressWidget

/// Simple widget showing completion percent and next milestone.
struct ProgressWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "ProgressWidget", provider: Provider()) { entry in
            ProgressWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Einbürgerung")
        .description("Zeigt den nächsten Meilenstein")
    }
}

struct ProgressEntry: TimelineEntry {
    let date: Date
    let plan: ProgressPlan
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> ProgressEntry {
        ProgressEntry(date: Date(), plan: ProgressDemoData.demoPlan)
    }

    func getSnapshot(in context: Context, completion: @escaping (ProgressEntry) -> Void) {
        completion(placeholder(in: context))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ProgressEntry>) -> Void) {
        let entry = ProgressEntry(date: Date(), plan: ProgressDemoData.demoPlan)
        completion(Timeline(entries: [entry], policy: .never))
    }
}

struct ProgressWidgetEntryView: View {
    let entry: ProgressEntry

    var next: Milestone? { entry.plan.milestones.first { $0.status != .done } }

    var body: some View {
        VStack(alignment: .leading) {
            ProgressView(value: entry.plan.completion)
                .tint(AppColor.accent)
            if let next {
                Text(next.title)
                    .font(AppFont.caption())
            }
        }
        .padding()
    }
}
#endif
