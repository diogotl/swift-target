import Foundation

class GoalDetailsViewModel {
    let metaContext: MetaContext
    var id: UUID

    var onGoalChanged: ((Meta?) -> Void)?
    var goal: Meta?

    init(
        id: UUID,
        context: MetaContext
    ) {
        self.id = id
        metaContext = context
    }

    func fetchMeta() {
        let meta = metaContext.fetchMeta(withId: id)
        self.goal = meta
        onGoalChanged?(meta)
        return
    }
}
