import Foundation
import SwiftUI

// MARK: - Models

/// Milestone status enumeration
public enum MilestoneStatus: String, Codable {
    case pending
    case done
    case overdue
}

/// Represents a single milestone in a progress plan.
public struct Milestone: Identifiable, Codable, Hashable {
    public var id: UUID
    public var title: String
    public var dueDate: Date
    public var status: MilestoneStatus
    public var iconName: String

    public init(id: UUID = UUID(), title: String, dueDate: Date, status: MilestoneStatus = .pending, iconName: String) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.status = status
        self.iconName = iconName
    }
}

/// A plan consisting of multiple milestones.
public struct ProgressPlan: Identifiable, Codable {
    public var id: UUID
    public var title: String
    public var milestones: [Milestone]

    public init(id: UUID = UUID(), title: String, milestones: [Milestone]) {
        self.id = id
        self.title = title
        self.milestones = milestones
    }

    /// Percentage of completed milestones between 0 and 1.
    public var completion: Double {
        guard !milestones.isEmpty else { return 0 }
        let doneCount = milestones.filter { $0.status == .done }.count
        return Double(doneCount) / Double(milestones.count)
    }
}
