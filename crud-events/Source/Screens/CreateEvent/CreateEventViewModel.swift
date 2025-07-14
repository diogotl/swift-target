//
//  CreateEventViewModel.swift
//  crud-events
//
//  Created by Diogo on 12/07/2025.
//

import Foundation

class CreateEventViewModel {
   
    func submitEvent(name: String, date: Date, description: String, completion: @escaping (Bool) -> Void) {
        // Here you would typically handle the logic to save the event data
        
        // Simulating a network call or database save with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            print("Event submitted with name: \(name), date: \(date), description: \(description)")
            completion(true)
        }
    }
}
