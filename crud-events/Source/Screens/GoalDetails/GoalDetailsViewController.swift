import UIKit
import Foundation

class GoalsDetailsViewController: UIViewController {
    private let contentView: GoalDetailsView
    private let goal: Goal

    init(goal: Goal, contentView: GoalDetailsView) {
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
