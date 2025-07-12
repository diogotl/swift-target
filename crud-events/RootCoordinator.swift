//
//  RootCoordinator.swift
//  crud-events
//
//  Created by Diogo on 09/07/2025.
//

import Foundation
import UIKit

class RootCoordinator {
    
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let splashView = EventsListView()
        let startViewController = EventsListViewController(
            contentView: splashView,
            coordinatorDelegate: self
        )
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        
        return navigationController;
    }
}

extension RootCoordinator: EventsListViewFlowDelegate {
    func navigateToCreateEvent() {
        let createEventView = CreateEventView()
        let createEventController = CreateEventController(contentView: createEventView)
        
        self.navigationController?.pushViewController(createEventController, animated: true)
        
    }
}
    

