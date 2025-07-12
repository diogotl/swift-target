import Foundation
import UIKit

class EventsListView: UIView {
    
    public weak var delegate: EventsListViewFlowDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Event", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(createEventButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    func createEventButtonTapped() {
        if (self.backgroundColor == .green) {
            self.backgroundColor = .blue
        } else {
            self.backgroundColor = .purple
        }
        
        delegate?.navigateToCreateEvent()
    }
    
    private func setupUI() {
        self.backgroundColor = .green
        addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
}
