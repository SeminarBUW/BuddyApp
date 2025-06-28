// swiftlint:disable all
import Foundation

// MARK: - ViewModel

/// View model driving `FormWizardView` navigation.
public final class FormWizardViewModel: ObservableObject {
    @Published public var steps: [FormStep]
    @Published public private(set) var currentIndex: Int = 0
    @Published public var isCompleted = false

    public init(steps: [FormStep]) {
        self.steps = steps
    }

    public func next() {
        if currentIndex < steps.count - 1 {
            currentIndex += 1
        } else {
            isCompleted = true
        }
    }

    public func previous() {
        if currentIndex > 0 { currentIndex -= 1 }
    }
}
