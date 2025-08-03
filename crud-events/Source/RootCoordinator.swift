import Foundation
import UIKit

class RootCoordinator {

    private var navigationController: UINavigationController?
    
    private let metaContext = MetaContext()

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

    func navigateToGoalDetails(meta: Meta) {
        let goalDetailsView = GoalDetailsView(
            goal: meta
        )

        let goalDetailsController = GoalsDetailsViewController(
            goal: meta,
            contentView: goalDetailsView,
        )

        self.navigationController?.pushViewController(goalDetailsController, animated: true)
    }
}

extension RootCoordinator: CreateEventViewFlowDelegate {

    func navigateToCreateTransaction() {

        let contentView = NewTransactionView()
        let newTransactionController = NewTransactionController(
            contentView: contentView
        )

        self.navigationController?.pushViewController(newTransactionController, animated: true)
    }
}

extension RootCoordinator: NewTransactionViewFlowDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
