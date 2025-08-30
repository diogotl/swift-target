//
//  NewTransactionController.swift
//  crud-events
//
//  Created by Diogo on 12/07/2025.
//

import Foundation
import UIKit

class NewTransactionController: UIViewController {
    
    var contentView: NewTransactionView;
    let viewModel: NewTransactionViewModel
    weak var coordinatorDelegate: NewTransactionViewFlowDelegate?
    
    init(
        contentView: NewTransactionView,
        viewModel: NewTransactionViewModel,
        coordinatorDelegate: NewTransactionViewFlowDelegate?
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate
        super.init(nibName: nil, bundle: nil)
        self.contentView.delegate = self
        
        viewModel.didCreateTransaction = { [weak self] success in
            if success {
                print("Transaction created successfully")
                
            } else {
                print("Failed to create transaction")
            }
        }
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        view.addSubview(contentView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension NewTransactionController: NewTransactionViewDelegate {
    func didPressCreateTransaction(
        type: TransactionType,
        amount: Double,
        reason: String,
    ) {
        
        print("Creating transaction with type: \(type), amount: \(amount), reason: \(reason)")
        viewModel.createTransaction(type: type, amount: amount, reason: reason)
    }
    
    func didPressBackButton() {
        coordinatorDelegate?.popView()
    }
}
