import CoreData
import Foundation
import UIKit

class RootCoordinator {

    private var navigationController: UINavigationController?

    private let metaContext = MetaContext()
    private let transactionContext = TransactionContext()

    public init() {}

    func start() -> UINavigationController? {
        let splashView = EventsListView()
        let viewModel = GoalsViewModel(
            context: metaContext
        )
        let startViewController = EventsListViewController(
            contentView: splashView,
            viewModel: viewModel,
            coordinatorDelegate: self
        )

        self.navigationController = UINavigationController(rootViewController: startViewController)

        return navigationController
    }
}

extension RootCoordinator: EventsListViewFlowDelegate {

    func navigateToCreateEvent() {
        let createEventView = CreateEventView()
        let viewModel = CreateEventViewModel(
            metaContext: metaContext
        )

        let createEventController = CreateEventController(
            contentView: createEventView,
            viewModel: viewModel,
            coordinatorDelegate: self
        )

        self.navigationController?.pushViewController(createEventController, animated: true)

    }

    func navigateToGoalDetails(
        metaId: UUID
    ) {
        let goalDetailsView = GoalDetailsView()
        let viewModel = GoalDetailsViewModel(
            id: metaId,
            context: metaContext
        )

        let goalDetailsController = GoalsDetailsViewController(
            goalId: metaId,
            contentView: goalDetailsView,
            viewModel: viewModel,
            coordinatorDelegate: self
        )

        self.navigationController?.pushViewController(goalDetailsController, animated: true)
    }
}

extension RootCoordinator: CreateEventViewFlowDelegate {

    func navigateToCreateTransaction() {

        let contentView = NewTransactionView()
        let viewModel = NewTransactionViewModel(
            transactionContext: transactionContext
        )
        let newTransactionController = NewTransactionController(
            contentView: contentView,
            viewModel:viewModel,
            coordinatorDelegate: self
        )

        self.navigationController?.pushViewController(newTransactionController, animated: true)
    }
}

extension RootCoordinator: NewTransactionViewFlowDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RootCoordinator: GoalsDetailsViewFlowDelegate {
    func didPressEditGoal() {
        print("DEBUG: Edit goal pressed")
    }
    
    func goToCreateTransaction(goalId: UUID) {
        let contentView = NewTransactionView()
        let viewModel = NewTransactionViewModel(
            transactionContext: transactionContext,
            id: goalId
        )
        let newTransactionController = NewTransactionController(
            contentView: contentView,
            viewModel: viewModel,
            coordinatorDelegate: self
        )

        self.navigationController?.pushViewController(newTransactionController, animated: true)
    }
    
}
