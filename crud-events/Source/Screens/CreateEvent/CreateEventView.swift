import Foundation
import UIKit

class CreateEventView: UIView {

    public weak var delegate: CreateEventViewDelegate?

    // MARK: - Design System
    private struct Design {
        static let primaryBlue = UIColor(red: 0.25, green: 0.32, blue: 0.71, alpha: 1.0)  // Azul do header
        static let backgroundColor = UIColor.systemBackground
        static let textColor = UIColor.label
        static let placeholderColor = UIColor.placeholderText
        static let separatorColor = UIColor.separator

        static let headerHeight: CGFloat = 100
        static let spacing: CGFloat = 24
        static let fieldHeight: CGFloat = 50
        static let buttonHeight: CGFloat = 56
        static let cornerRadius: CGFloat = 12
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Design.backgroundColor
        setupUI()
        setupValidation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Components

    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = Design.primaryBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

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
        label.text = "Crie seu evento para organizar melhor suas atividades."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Design.textColor
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Form Fields

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome do evento"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Design.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let nameField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Reunião de trabalho, Aniversário"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = Design.textColor
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let nameSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Design.separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Data do evento"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Design.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let dateField: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    private let dateSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Design.separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Local do evento"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Design.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let locationField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Ex: Sala de reuniões, Casa da família"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = Design.textColor
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let locationSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Design.separatorColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = Design.primaryBlue
        button.tintColor = .white
        button.layer.cornerRadius = Design.cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let newTransaction: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nova Transação", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = Design.primaryBlue.withAlphaComponent(0.1)
        button.tintColor = Design.primaryBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Setup Methods

    private func setupUI() {
        // Add main components
        addSubview(headerView)
        addSubview(contentView)

        // Header components
        headerView.addSubview(headerTitle)
        headerView.addSubview(backButton)

        // Content components
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(newTransaction)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameField)
        contentView.addSubview(nameSeparator)
        contentView.addSubview(dateLabel)
        contentView.addSubview(dateField)
        contentView.addSubview(dateSeparator)
        contentView.addSubview(locationLabel)
        contentView.addSubview(locationField)
        contentView.addSubview(locationSeparator)
        contentView.addSubview(submitButton)

        setupConstraints()
        setupActions()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Header
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Design.headerHeight),

            // Header title
            headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),

            // Back button
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: headerTitle.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),

            // Content view
            contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            // Description
            descriptionLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: Design.spacing),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),

            // New transaction button
            newTransaction.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor, constant: Design.spacing),
            newTransaction.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            newTransaction.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            newTransaction.heightAnchor.constraint(equalToConstant: 44),

            // Name field
            nameLabel.topAnchor.constraint(
                equalTo: newTransaction.bottomAnchor, constant: Design.spacing * 1.5),
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            nameLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),

            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            nameField.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            nameField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            nameField.heightAnchor.constraint(equalToConstant: Design.fieldHeight),

            nameSeparator.topAnchor.constraint(equalTo: nameField.bottomAnchor),
            nameSeparator.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            nameSeparator.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            nameSeparator.heightAnchor.constraint(equalToConstant: 1),

            // Date field
            dateLabel.topAnchor.constraint(
                equalTo: nameSeparator.bottomAnchor, constant: Design.spacing),
            dateLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            dateLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),

            dateField.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 12),
            dateField.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            dateField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            dateField.heightAnchor.constraint(equalToConstant: Design.fieldHeight),

            dateSeparator.topAnchor.constraint(equalTo: dateField.bottomAnchor),
            dateSeparator.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            dateSeparator.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            dateSeparator.heightAnchor.constraint(equalToConstant: 1),

            // Location field
            locationLabel.topAnchor.constraint(
                equalTo: dateSeparator.bottomAnchor, constant: Design.spacing),
            locationLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            locationLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),

            locationField.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 12),
            locationField.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            locationField.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            locationField.heightAnchor.constraint(equalToConstant: Design.fieldHeight),

            locationSeparator.topAnchor.constraint(equalTo: locationField.bottomAnchor),
            locationSeparator.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            locationSeparator.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            locationSeparator.heightAnchor.constraint(equalToConstant: 1),

            // Submit button
            submitButton.topAnchor.constraint(
                equalTo: locationSeparator.bottomAnchor, constant: Design.spacing * 2),
            submitButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: Design.spacing),
            submitButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -Design.spacing),
            submitButton.heightAnchor.constraint(equalToConstant: Design.buttonHeight),
        ])
    }

    private func setupActions() {
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        newTransaction.addTarget(self, action: #selector(newTransactionTapped), for: .touchUpInside)
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
        let date = dateField.date
        let description = locationField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        // Loading state
        submitButton.isEnabled = false
        submitButton.setTitle("Salvando...", for: .normal)
        submitButton.alpha = 0.7

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.delegate?.didSubmitEvent(name: name, date: date, description: description)
            self.resetForm()
        }
    }

    // MARK: - Validation & Helpers

    func isFormValid() -> Bool {
        let hasName =
            !(nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
        let hasLocation =
            !(locationField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)

        return hasName && hasLocation
    }

    private func updateSubmitButtonState() {
        let isValid = isFormValid()

        UIView.animate(withDuration: 0.2) {
            self.submitButton.alpha = isValid ? 1.0 : 0.6
            self.submitButton.backgroundColor =
                isValid ? Design.primaryBlue : Design.primaryBlue.withAlphaComponent(0.6)
        }
    }

    private func resetForm() {
        submitButton.isEnabled = true
        submitButton.setTitle("Salvar", for: .normal)
        submitButton.alpha = 1.0
        submitButton.backgroundColor = Design.primaryBlue
    }
}
