import Foundation
import UIKit

enum TransactionType {
    case income
    case expense
}

struct Transaction {
    let type: TransactionType
    let amount: String
    let description: String
    let date: Date
}
