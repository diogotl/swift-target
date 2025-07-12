//
//  CreateEventController.swift
//  crud-events
//
//  Created by Diogo on 10/07/2025.
//

import Foundation
import UIKit

class CreateEventController: UIViewController {
    
    var contentView: CreateEventView;
    
    init(
        contentView: CreateEventView
    ){
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.view = contentView
    }
    
}
