import Foundation

class GoalsViewModel {
    public var goals: [Goal] = [
        Goal(id: "1", title: "Learn Swift", progress: 50, total: 100),
        Goal(id: "2", title: "Build an App", progress: 20, total: 100),
        Goal(id: "3", title: "Read a Book", progress: 75, total: 100),
        Goal(id: "4", title: "Exercise Regularly", progress: 30, total: 100),
        Goal(id: "5", title: "Save Money", progress: 60, total: 100)
    ]
}
