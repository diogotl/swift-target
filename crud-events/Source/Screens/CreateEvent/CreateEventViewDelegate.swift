//
//  CreateEventViewDelegate.swift
//  crud-events
//
//  Created by Diogo on 12/07/2025.
//

import Foundation

protocol CreateEventViewDelegate: AnyObject {
    func didSubmitEvent(name: String, date: Date, description: String)
    func didPressNavigateToCreateTransaction()
    func didPressBackButton()
}

