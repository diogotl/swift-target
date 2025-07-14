//
//  NewTransactionView.swift
//  crud-events
//
//  Created by Diogo on 12/07/2025.
//

import UIKit
import Foundation

class NewTransactionView: UIView {
    
    weak public var delegate: NewTransactionViewDelegate?
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        self.backgroundColor = .white
        print("NewTransactionView initialized")
        setupUI()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "New Transaction"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionField: UILabel = {
        let label = UILabel()
        label.text = "A cada meta ficas mais perto do teu sonho!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Income", "Expense"])
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let amountField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter amount"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let reasaonField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter reason"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func submitTapped() {
        // Handle submit action
        print("Submit button tapped")
    }
    
    @objc
    private func backTapped() {
        // Handle back action
        print("Back button tapped")
    }
        
    
    private func setupUI() {
        addSubview(backButton)
        addSubview(title)
        addSubview(descriptionField)
        addSubview(segmentedControl)
        addSubview(amountField)
        addSubview(reasaonField)
        addSubview(submitButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            descriptionField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
        
            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            segmentedControl.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 20),
            
            amountField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            amountField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            amountField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            reasaonField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            reasaonField.topAnchor.constraint(equalTo: amountField.bottomAnchor, constant: 20),
            reasaonField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            submitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: reasaonField.bottomAnchor, constant: 20),
            //submitButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
        
}
