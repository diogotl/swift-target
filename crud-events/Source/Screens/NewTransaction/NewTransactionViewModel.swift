//
//  NewTransactionViewModel.swift
//  crud-events
//
//  Created by Diogo on 30/08/2025.
//
import Foundation

class NewTransactionViewModel {

    var id: UUID?

    let transactionContext: TransactionContext

    var didCreateTransaction: ((Bool) -> Void)?

    init(
        transactionContext: TransactionContext,
        id: UUID? = nil
    ) {
        self.id = id
        self.transactionContext = transactionContext
    }

    func createTransaction(
        type: TransactionType,
        amount: Double,
        reason: String,
    ) {
        
        guard let id = id else {
            print("Error: Meta ID is nil. Cannot create transaction.")
            didCreateTransaction?(false)
            return
        }
        
        let newTransaction = Transaction(
            id: UUID(),
            type: type,
            amount: amount,
            description: reason,
            date: Date(),
            metaId: id
        )
        let result = transactionContext.addTransaction(transaction: newTransaction)
        
        print(result)
       
            
        didCreateTransaction?(true)
    }

}
