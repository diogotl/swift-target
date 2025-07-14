//
//  CreateEventController.swift
//  crud-events
//
//  Created by Diogo on 10/07/2025.
//

import Foundation
import UIKit

class CreateEventController: UIViewController {
    
    var contentView: CreateEventView;
    var viewModel: CreateEventViewModel;
    weak var coordinatorDelegate: CreateEventViewFlowDelegate?
    
    init(
        contentView: CreateEventView,
        viewModel: CreateEventViewModel,
        coordinatorDelegate: CreateEventViewFlowDelegate?
    ){
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate
       
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
        self.contentView.delegate = self
        self.contentView.backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.view = contentView
    }
    
}

extension CreateEventController: CreateEventViewDelegate {
    func didPressNavigateToCreateTransaction() {
        coordinatorDelegate?.navigateToCreateTransaction()
    }
    
    func didPressBackButton() {
        coordinatorDelegate?.popView()
    }
    
    func didSubmitEvent(name: String, date: Date, description: String) {
        viewModel.submitEvent(name: name, date: date, description: description) { [weak self] success in
            guard let self = self else { return }
            if success {
                // Handle success (e.g., show a success message or navigate back)
                
                self.navigationController!.popViewController(animated: true)
                
            } else {
                // Handle failure (e.g., show an error message)
                print("Failed to create event")
            }
        }
    }
    
}
