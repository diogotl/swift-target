import Foundation
import UIKit

class CreateEventView: UIView {

    public weak var delegate: CreateEventViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.systemGray6
        setupUI()
        setupValidation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Components

    private let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Home - Novo"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Economize para alcançar sua meta financeira."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Form Fields

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do evento"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let nameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Reunião de trabalho, Aniversário"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .blue
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let nameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Local do evento"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let locationField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Sala de reuniões, Casa da família"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .gray
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let locationSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    func didTapSubmitButton() {
        guard !isFormValid() else {
            // Show validation error
            return
        }
        
        delegate?.didSubmitEvent(
            name: nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "",
            date: Date(),
            description: locationField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        )
    }


    // MARK: - Setup Methods

    private func setupUI() {
        addSubview(contentView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameField)
        contentView.addSubview(nameSeparator)
        //contentView.addSubview(dateField)
        //contentView.addSubview(dateSeparator)
        contentView.addSubview(locationLabel)
        contentView.addSubview(locationField)
        contentView.addSubview(locationSeparator)
        contentView.addSubview(submitButton)

        setupConstraints()
        setupActions()
    }

    private func setupConstraints() {
        let spacing: CGFloat = 16
        let fieldHeight: CGFloat = 40
        let buttonHeight: CGFloat = 48

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),

            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            nameField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            nameField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            nameField.heightAnchor.constraint(equalToConstant: fieldHeight),

            nameSeparator.topAnchor.constraint(equalTo: nameField.bottomAnchor),
            nameSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            nameSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            nameSeparator.heightAnchor.constraint(equalToConstant: 1),

            locationLabel.topAnchor.constraint(equalTo: nameSeparator.bottomAnchor, constant: spacing),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),

            locationField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 12),
            locationField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            locationField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            locationField.heightAnchor.constraint(equalToConstant: fieldHeight),

            locationSeparator.topAnchor.constraint(equalTo: locationField.bottomAnchor),
            locationSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            locationSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            locationSeparator.heightAnchor.constraint(equalToConstant: 1),

            submitButton.topAnchor.constraint(equalTo: locationSeparator.bottomAnchor, constant: spacing * 2),
            submitButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: spacing),
            submitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -spacing),
            submitButton.heightAnchor.constraint(equalToConstant: buttonHeight),
        ])
    }

    private func setupActions() {
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        //newTransaction.addTarget(self, action: #selector(newTransactionTapped), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
    }

    private func setupValidation() {
        nameField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        locationField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    // MARK: - Actions

    @objc private func backTapped() {
        delegate?.didPressBackButton()
    }

    @objc private func newTransactionTapped() {
        delegate?.didPressNavigateToCreateTransaction()
    }

    @objc private func textFieldDidChange() {
        updateSubmitButtonState()
    }

    @objc private func submitTapped() {
        guard isFormValid() else { return }

        let name = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       // let date = dateField.date
        let description = locationField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        submitButton.isEnabled = false
        submitButton.setTitle("Salvando...", for: .normal)
        submitButton.alpha = 0.7

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.delegate?.didSubmitEvent(name: name, date: Date(), description: description)
            self.resetForm()
        }
    }

    // MARK: - Validation & Helpers

    func isFormValid() -> Bool {
        let hasName = !(nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
        let hasLocation = !(locationField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
        return hasName && hasLocation
    }

    private func updateSubmitButtonState() {
        let isValid = isFormValid()
        UIView.animate(withDuration: 0.2) {
            self.submitButton.alpha = isValid ? 1.0 : 0.6
            self.submitButton.backgroundColor = isValid ? .systemBlue : .systemRed
        }
    }

    private func resetForm() {
        submitButton.isEnabled = true
        submitButton.setTitle("Salvar", for: .normal)
        submitButton.alpha = 1.0
        submitButton.backgroundColor = .systemBlue
    }
}
