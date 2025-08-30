//
//  CreateEventViewModel.swift
//  crud-events
//
//  Created by Diogo on 12/07/2025.
//

import Foundation

class CreateEventViewModel {
    
    let metaContext: MetaContext
    
    init(
        metaContext: MetaContext
    ){
        self.metaContext = metaContext
    }
    
   var onMetasChanged: (() -> Void)?

    func submitEvent(
        name: String, date: Date, description: String, completion: @escaping (Bool) -> Void
    ) {

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("Event submitted with name: \(name), date: \(date), description: \(description)")
            completion(true)
        }
    }
    
    
    func addGoal(title: String, total: Int, completion: @escaping (Bool) -> Void) {
        print("Adding goal with title: \(title), total: \(total)")
        let newGoal = Meta(
            id: UUID(),
            title: title,
            progress: 0,
            total: total
        )
        let success = metaContext.addMeta(meta: newGoal)
        onMetasChanged?()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(success)
        }
    }
}
