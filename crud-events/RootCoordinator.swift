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
    
    public init() {}
    
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
        let viewModel = CreateEventViewModel()
        
        let createEventController = CreateEventController(
            contentView: createEventView,
            viewModel: viewModel,
            coordinatorDelegate: self
        )
        
        self.navigationController?.pushViewController(createEventController, animated: true)
        
    }
}

extension RootCoordinator: CreateEventViewFlowDelegate {

       
    
    func navigateToCreateTransaction() {
        
        let contentView = NewTransactionView()
        let newTransactionController = NewTransactionController(
            contentView: contentView
        )
        
        self.navigationController?.pushViewController(newTransactionController, animated: true)
    }
}

extension RootCoordinator: NewTransactionViewFlowDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
    

