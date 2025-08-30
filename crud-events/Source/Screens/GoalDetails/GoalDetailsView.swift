import Foundation
import UIKit

class GoalDetailsView: UIView {
    
    weak var delegate: GoalDetailsViewDelegate?
        
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.identifier)
        return tableView
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        
        button.setImage(
            UIImage(systemName: "pencil"),
            for: .normal
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 26.0, *) {
            UIGlassEffect.init(style:.regular).prepareForInterfaceBuilder()
        } else {
            
        }
        return button
    }()
    
    let newTransactionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New Transaction", for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editTapNewTrasactionButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func editTapNewTrasactionButton() {
        print("DEBUG: editTapNewTrasactionButton chamado em GoalDetailsView")
        delegate?.didTapNewTransactionButton()
    }
    
    override init(
        frame: CGRect = .zero
    ) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(editButton)
        addSubview(nameLabel)
        addSubview(transactionsTableView)
        addSubview(newTransactionButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            nameLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: -8),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            transactionsTableView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            transactionsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            transactionsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            transactionsTableView.bottomAnchor.constraint(equalTo: newTransactionButton.topAnchor, constant: -16),
           
            
            newTransactionButton.topAnchor.constraint(equalTo: transactionsTableView.bottomAnchor, constant: 16),
            newTransactionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            newTransactionButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            newTransactionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            newTransactionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
