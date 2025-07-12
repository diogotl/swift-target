import Foundation
import UIKit

class EventsListViewController: UIViewController {
    private let contentView: EventsListView
    weak var coordinatorDelegate: EventsListViewFlowDelegate?

    init(
        contentView: EventsListView,
        coordinatorDelegate: EventsListViewFlowDelegate?
    ) {
        self.contentView = contentView
        self.coordinatorDelegate = coordinatorDelegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentView.delegate = self
        setup()
    }
    
    private func setup() {
        view.addSubview(contentView)
        self.view.backgroundColor = .darkGray
        //contentView.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension EventsListViewController: EventsListViewFlowDelegate {
    func navigateToCreateEvent() {
        coordinatorDelegate?.navigateToCreateEvent()
    }
}
