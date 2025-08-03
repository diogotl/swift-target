import Foundation

class GoalsViewModel {
    let metaContext: MetaContext
    
    init(context: MetaContext){
        metaContext = context
    }
    
    //callback
    var onMetasChanged: (() -> Void)?
    
    var goals: [Meta] = []
    
    func fetchGoals() -> [Meta] {
        goals = metaContext.fetchMetas()
        onMetasChanged?()
        return goals
    }
    
}
