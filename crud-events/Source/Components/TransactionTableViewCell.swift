import Foundation
import UIKit

class TransactionTableViewCell: UITableViewCell {

    static let identifier = "TransactionTableViewCell"

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconImageView)
        contentView.addSubview(amountLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(closeButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),

            amountLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            closeButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

        ])

    }

    func configure(with transaction: Transaction) {

        if transaction.type == .income {
            iconImageView.image = UIImage(systemName: "arrow.up.circle.fill")
        } else {
            iconImageView.image = UIImage(systemName: "arrow.down.circle.fill")
        }
        amountLabel.text = transaction.amount
        descriptionLabel.text = "\(transaction.date) \(transaction.description)"
    }

}
