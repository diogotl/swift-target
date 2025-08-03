import Foundation
import UIKit

class GoalCell: UITableViewCell {

    static let identifier = "GoalCell"

    private let goalTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    private let goalAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let goalProgressView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let totalAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailsIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "chevron.right"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .black
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(goalTitleLabel)
        contentView.addSubview(goalProgressView)
        contentView.addSubview(goalAmountLabel)
        contentView.addSubview(totalAmountLabel)
        contentView.addSubview(detailsIcon)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with goal: Meta) {
        goalTitleLabel.text = goal.title
        
        
        if goal.progress == 0 {
            goalAmountLabel.text = "0% ● \(goal.progress) of \(goal.total)"
        } else {
            goalAmountLabel.text = "\(goal.total / goal.progress * 100)% ● \(goal.progress) of \(goal.total)"
        }

        //goalAmountLabel.text = "\(goal.total)"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            goalTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            goalTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            goalProgressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            goalProgressView.topAnchor.constraint(equalTo: goalTitleLabel.bottomAnchor, constant: 8),

            goalAmountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            goalAmountLabel.topAnchor.constraint(equalTo: goalProgressView.bottomAnchor, constant: 8),

            totalAmountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            totalAmountLabel.topAnchor.constraint(equalTo: goalAmountLabel.bottomAnchor, constant: 8),
            totalAmountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            detailsIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailsIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
