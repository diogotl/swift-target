//
//  GoalsDetailsViewFlowDelegate.swift
//  crud-events
//
//  Created by Diogo on 03/08/2025.
//

import CoreData

protocol GoalsDetailsViewFlowDelegate: AnyObject {
    func didPressEditGoal()
    func goToCreateTransaction(goalId: UUID)
}
