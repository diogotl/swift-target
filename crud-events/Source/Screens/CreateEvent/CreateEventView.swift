import Foundation
import UIKit

class CreateEventView: UIView {
    
    public weak var delegate: CreateEventViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        print("create event view initialized")
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func backTapped() {
        delegate?.didPressBackButton()
    }
    
    
    let newTransaction: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New Transaction", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(newTransactionTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func newTransactionTapped() {
        delegate?.didPressNavigateToCreateTransaction()
    }
    
    @objc
    private func tappedBack() {
        delegate?.didPressBackButton()
    }
    
    let screenTitle: UILabel = {
        let label = UILabel()
        label.text = "Create Event"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        //label.textAlignment = .center
        return label
    }()
    
    let nameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Event Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let dateField: UIDatePicker = {
        let textField = UIDatePicker()
        //textField.placeholder = "Event Date"
        textField.translatesAutoresizingMaskIntoConstraints = false
        //textField.borderStyle = .roundedRect
        //textField.borderStyle = .roundedRect
        return textField
    }()
    
    let locationField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Event Location"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        return button
    }()
    
    let stackForm: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    private func setupUI() {
        addSubview(backButton)
        addSubview(screenTitle)
        addSubview(stackForm)
        addSubview(newTransaction)
        stackForm.addArrangedSubview(nameField)
        stackForm.addArrangedSubview(dateField)
        stackForm.addArrangedSubview(locationField)
        stackForm.addArrangedSubview(submitButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            newTransaction.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            newTransaction.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            newTransaction.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            screenTitle.topAnchor.constraint(equalTo: self.newTransaction.bottomAnchor, constant: 20),
            screenTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            stackForm.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 20),
            stackForm.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackForm.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackForm.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            nameField.heightAnchor.constraint(equalToConstant: 40),
            dateField.heightAnchor.constraint(equalToConstant: 40),
            locationField.heightAnchor.constraint(equalToConstant: 40),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func isFormValid() -> Bool {
        
        guard let name = nameField.text, !name.isEmpty else {
            return false
        }
        
        guard let location = locationField.text, !location.isEmpty else {
            return false
        }
        
        return true
    }
    
    @objc
    private func submitTapped() {
            guard let name = nameField.text, !name.isEmpty else { return }
            let date = dateField.date
            let description = locationField.text ?? ""
        
        
        let isFormValid = isFormValid();
        
        if !isFormValid {
            // Handle invalid form (e.g., show an alert)
            print("Form is invalid. Please fill in all fields.")
            return;
        }
        
            delegate?.didSubmitEvent(name: name, date: date, description: description)
        }
}
