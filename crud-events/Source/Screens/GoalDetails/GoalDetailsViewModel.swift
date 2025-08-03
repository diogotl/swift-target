import Foundation

class GoalDetailsViewModel {
    private let goal: Meta
    
    init(goal: Meta) {
        self.goal = goal
    }
    
    var title: String {
        return goal.title
    }
    
    var progress: Int {
        return goal.progress
    }
    
    var total: Int {
        return goal.total
    }
    
    var progressPercentage: Double {
        return Double(progress) / Double(total) * 100.0
    }
    
    func updateProgress(newProgress: Int) {
        // Logic to update the progress of the goal
        // This could involve network requests or local database updates
        // For now, we will just simulate an update
        print("Updating progress for \(goal.title) to \(newProgress)")
    }

}
