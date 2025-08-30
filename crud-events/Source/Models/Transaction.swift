import Foundation
import UIKit

enum TransactionType: String, Codable {
    case income = "income"
    case expense = "expense"
}

struct Transaction: Codable, Identifiable {
    let id: UUID 
    let type: TransactionType
    let amount: Double
    let description: String
    let date: Date
    let metaId: UUID

    init(
        id: UUID, type: TransactionType, amount: Double, description: String, date: Date,
        metaId: UUID
    ) {
        self.id = id
        self.type = type
        self.amount = amount
        self.description = description
        self.date = date
        self.metaId = metaId
    }
}
