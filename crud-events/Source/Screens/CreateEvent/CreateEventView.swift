//
//  CreateEventView.swift
//  crud-events
//
//  Created by Diogo on 10/07/2025.
//

import Foundation
import UIKit

class CreateEventView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .blue
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([])
    }
}
