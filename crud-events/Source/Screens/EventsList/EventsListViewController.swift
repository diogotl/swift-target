import Foundation
import UIKit

class EventsListViewController: UIViewController {
    private let contentView: EventsListView
    private let viewModel: GoalsViewModel
    weak var coordinatorDelegate: EventsListViewFlowDelegate?

    init(
        contentView: EventsListView,
        viewModel: GoalsViewModel,
        coordinatorDelegate: EventsListViewFlowDelegate?
    ) {
        self.contentView = contentView
        self.viewModel = viewModel
        self.coordinatorDelegate = coordinatorDelegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.goals = viewModel.fetchGoals()
        contentView.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.delegate = self
        setup()

        viewModel.onMetasChanged = { [weak self] in
            self?.contentView.tableView.reloadData()
        }
        viewModel.fetchGoals()
    }

    private func setup() {
        view.addSubview(contentView)
        self.view.backgroundColor = .darkGray
        //contentView.delegate = self
        setupTableView()
        setupConstraints()
    }

    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(GoalCell.self, forCellReuseIdentifier: GoalCell.identifier)
        contentView.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }

    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension EventsListViewController: EventsListViewFlowDelegate {
    func navigateToGoalDetails(metaId meta: UUID) {
        coordinatorDelegate?.navigateToGoalDetails(
            metaId: meta
        )
    }

    func navigateToCreateEvent() {
        coordinatorDelegate?.navigateToCreateEvent()
    }
}

extension EventsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.goals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: GoalCell.identifier, for: indexPath)
            as! GoalCell
        let goal = viewModel.goals[indexPath.row]
        cell.configure(with: goal)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goal = viewModel.goals[indexPath.row]
        print("DEBUG: Célula selecionada na lista de metas. goal.id =", goal.id)
        coordinatorDelegate?.navigateToGoalDetails(
            metaId: goal.id
        )
    }
}
