//
//  NewTransactionDelegate.swift
//  crud-events
//
//  Created by Diogo on 13/07/2025.
//

protocol NewTransactionViewDelegate: AnyObject {
    func didSubmitTransaction()
    func didPressCreateTransaction(  type: TransactionType,
                                     amount: Double,
                                     reason: String,)
    func didPressBackButton()
}

