import Foundation
import UIKit

class EventsListView: UIView {

    public weak var delegate: EventsListViewFlowDelegate?
    private let gradientLayer = CAGradientLayer()

    private let summaryTopBorder = CALayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupGradient()
        setupTopBorder()
    }

    private func setupTopBorder() {
        summaryTopBorder.backgroundColor = UIColor.systemBlue.cgColor
        summaryTopBorder.cornerRadius = 1
        summaryCard.layer.addSublayer(summaryTopBorder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let resumeHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 59 / 255, green: 130 / 255, blue: 246 / 255, alpha: 1)
        return view
    }()

    let resumeHeaderTitle: UILabel = {
        let label = UILabel()
        label.text = "O saldo da tua conta"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let resumeHeaderSubtitle: UILabel = {
        let label = UILabel()
        label.text = "$ 80.000"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 59 / 255, green: 130 / 255, blue: 246 / 255, alpha: 1).cgColor,  // blue-500
            UIColor(red: 37 / 255, green: 99 / 255, blue: 235 / 255, alpha: 1).cgColor,  // blue-600
            UIColor(red: 30 / 255, green: 64 / 255, blue: 175 / 255, alpha: 1).cgColor,  // blue-800
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        resumeHeader.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = resumeHeader.bounds

        let borderHeight: CGFloat = 3
        let borderInset: CGFloat = 10
        summaryTopBorder.frame = CGRect(
            x: borderInset,
            y: 0,
            width: summaryCard.bounds.width - (borderInset * 2),
            height: borderHeight)
    }

    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("New Meta", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(
            red: 29 / 255, green: 78 / 255, blue: 216 / 255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(createEventButtonTapped), for: .touchUpInside)
        return button
    }()

    let summaryCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //
        return view
    }()

    let profitIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.up")
        imageView.tintColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let profitTitle: UILabel = {
        let label = UILabel()
        label.text = "Entradas"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    let profitValue: UILabel = {
        let label = UILabel()
        label.text = "$10.000"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lossIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.down")
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let lossTitle: UILabel = {
        let label = UILabel()
        label.text = "Saídas"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let lossValue: UILabel = {
        let label = UILabel()
        label.text = "$ 2.000"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    @objc
    func createEventButtonTapped() {
        delegate?.navigateToCreateEvent()
    }
    
    let tableTitle: UILabel = {
        let label = UILabel()
        label.text = "Metas"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private func setupUI() {
        self.backgroundColor = .white
        addSubview(resumeHeader)
        resumeHeader.addSubview(summaryCard)
        summaryCard.addSubview(resumeHeaderTitle)
        summaryCard.addSubview(resumeHeaderSubtitle)
        summaryCard.addSubview(profitIcon)
        summaryCard.addSubview(profitTitle)
        summaryCard.addSubview(profitValue)
        summaryCard.addSubview(lossIcon)
        summaryCard.addSubview(lossTitle)
        summaryCard.addSubview(lossValue)
        
        addSubview(tableTitle)
        addSubview(button)
        addSubview(tableView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            resumeHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            resumeHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            resumeHeader.topAnchor.constraint(equalTo: self.topAnchor),
            resumeHeader.heightAnchor.constraint(equalToConstant: 333),
            
            summaryCard.leadingAnchor.constraint(equalTo: resumeHeader.leadingAnchor, constant: 20),
            summaryCard.trailingAnchor.constraint(
                equalTo: resumeHeader.trailingAnchor, constant: -20),
         
            summaryCard.bottomAnchor.constraint(equalTo: resumeHeader.bottomAnchor, constant: -20),
            summaryCard.heightAnchor.constraint(equalToConstant: 200),

            resumeHeaderTitle.leadingAnchor.constraint(
                equalTo: summaryCard.leadingAnchor, constant: 0),
            resumeHeaderTitle.bottomAnchor.constraint(
                equalTo: resumeHeaderSubtitle.topAnchor, constant: -10),

            resumeHeaderSubtitle.leadingAnchor.constraint(
                equalTo: summaryCard.leadingAnchor, constant: 0),
            
            resumeHeaderSubtitle.bottomAnchor.constraint(
                equalTo: profitIcon.topAnchor, constant: -24),


            profitIcon.leadingAnchor.constraint(equalTo: summaryCard.leadingAnchor, constant: 0),
            //profitIcon.topAnchor.constraint(equalTo: summaryCard.topAnchor, constant: 0),
            profitIcon.bottomAnchor.constraint(equalTo: profitValue.topAnchor, constant: -8),
            profitIcon.widthAnchor.constraint(equalToConstant: 24),
            profitIcon.heightAnchor.constraint(equalToConstant: 24),
            
            //profitTitle.topAnchor.constraint(equalTo: summaryCard.topAnchor, constant: 10),
            profitTitle.leadingAnchor.constraint(equalTo: profitIcon.trailingAnchor, constant: 10),
            profitTitle.centerYAnchor.constraint(equalTo: profitIcon.centerYAnchor),
            
            profitValue.leadingAnchor.constraint(equalTo: profitIcon.leadingAnchor, constant: 10),
           // profitValue.topAnchor.constraint(equalTo: profitIcon.bottomAnchor, constant: 10),
            profitValue.bottomAnchor.constraint(equalTo: summaryCard.bottomAnchor, constant: -10),
                
            lossIcon.trailingAnchor.constraint(equalTo: lossTitle.leadingAnchor, constant: -20),
            //lossIcon.topAnchor.constraint(equalTo: summaryCard.topAnchor, constant: 20),
            lossIcon.widthAnchor.constraint(equalToConstant: 24),
            lossIcon.heightAnchor.constraint(equalToConstant: 24),
            
            lossTitle.trailingAnchor.constraint(equalTo: summaryCard.trailingAnchor, constant: 10),
            //lossTitle.topAnchor.constraint(equalTo: summaryCard.topAnchor, constant: 10),
            lossTitle.centerYAnchor.constraint(equalTo: lossIcon.centerYAnchor),
            lossTitle.topAnchor.constraint(equalTo: profitTitle.bottomAnchor, constant: 20),
            
            //lossValue.topAnchor.constraint(equalTo: lossIcon.bottomAnchor, constant: 10),
            lossValue.trailingAnchor.constraint(equalTo: summaryCard.trailingAnchor, constant: -10),
            lossValue.bottomAnchor.constraint(equalTo: summaryCard.bottomAnchor, constant: -10),

            tableTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableTitle.topAnchor.constraint(equalTo: resumeHeader.bottomAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: tableTitle.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),

            button.heightAnchor.constraint(equalToConstant: 44),
            button.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
}
