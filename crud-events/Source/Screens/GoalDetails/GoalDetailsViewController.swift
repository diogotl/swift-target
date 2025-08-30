import CoreData
import Foundation
import UIKit

class GoalsDetailsViewController: UIViewController {
    
    private let contentView: GoalDetailsView
    private let viewModel: GoalDetailsViewModel
    
    weak var coordinatorDelegate: GoalsDetailsViewFlowDelegate?
    
    init(
        goalId: UUID,
        contentView: GoalDetailsView,
        viewModel: GoalDetailsViewModel,
        coordinatorDelegate: GoalsDetailsViewFlowDelegate?
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate
        
        super.init(nibName: nil, bundle: nil)
        self.contentView.delegate = self
        
        viewModel.onGoalChanged = { [weak self] goal in
            contentView.nameLabel.text = viewModel.goal?.title

        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.transactionsTableView.dataSource = self
        viewModel.onGoalChanged = { [weak self] success in
            self?.contentView.transactionsTableView.reloadData()
        }
        setup()
        viewModel.fetchMeta()
    }
    
    private func setup() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
}

extension GoalsDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.goal?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
        tableView.dequeueReusableCell(
            withIdentifier: TransactionTableViewCell.identifier, for: indexPath)
        as! TransactionTableViewCell
        
        let transaction = viewModel.goal?.transactions[indexPath.row]
        guard let transaction = transaction else {
            return cell
        }
        cell.configure(with: transaction)
        return cell
    }
}

extension GoalsDetailsViewController: GoalDetailsViewDelegate {
    func didTapNewTransactionButton() {
        coordinatorDelegate?.goToCreateTransaction(
            goalId: viewModel.id
        )
    }
    
    func didPressEditGoal() {
        //
    }
    
}
