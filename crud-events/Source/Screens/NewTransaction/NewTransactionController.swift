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
    weak var coordinatorDelegate: NewTransactionViewFlowDelegate?
    
    init(
        contentView: NewTransactionView
    ) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        self.contentView.delegate = self
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
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
    }
    
    func didSubmitTransaction() {
        print("Transaction submitted")
    }
    
    func didPressBackButton() {
        coordinatorDelegate?.popView()
    }
}
