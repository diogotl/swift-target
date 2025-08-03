//
//  CreateEventController.swift
//  crud-events
//
//  Created by Diogo on 10/07/2025.
//

import Foundation
import UIKit

class CreateEventController: UIViewController {
    
    var contentView: CreateEventView
    var viewModel: CreateEventViewModel
    weak var coordinatorDelegate: CreateEventViewFlowDelegate?
    
    init(
        contentView: CreateEventView,
        viewModel: CreateEventViewModel,
        coordinatorDelegate: CreateEventViewFlowDelegate?
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate
        
        super.init(nibName: nil, bundle: nil)
        self.contentView.delegate = self
        self.contentView.backgroundColor = .white
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.view = contentView
        //setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
        print("Submitting event with name: \(name), date: \(date), description: \(description)")
        
        viewModel.addGoal(title: name, total: 3000) { success in
            if success {
                self.coordinatorDelegate?.popView()
            } else {
                print("Erro ao inserir meta.")
            }
        }
        
    }
}
