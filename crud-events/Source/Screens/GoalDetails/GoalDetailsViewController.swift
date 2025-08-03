import UIKit
import Foundation

class GoalsDetailsViewController: UIViewController {
    
    private let contentView: GoalDetailsView
    private let goal: Meta
    
    weak var coordinatorDelegate: GoalsDetailsViewFlowDelegate?

    init(goal: Meta, contentView: GoalDetailsView) {
        self.goal = goal
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        //self.contentView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.transactionsTableView.dataSource = self
        setup()
    }

    private func setup() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    
    }
}

extension GoalsDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        // Configure the cell with the goal's transactions
        // Assuming goal has a transactions property
        //cell.configure(with: goal.transactions[indexPath.row])
        return cell
    }
}

extension GoalsDetailsViewController: GoalDetailsViewDelegate {
    func didPressEditGoal() {
        //
    }
    
    func didTapNewTransactionButton(goalId: UUID) {
        
    }
    
}
