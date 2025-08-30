import Foundation

class Meta: Codable {
    let id: UUID
    let title: String
    let progress: Int
    let total: Int
    let transactions: [Transaction]

    init(id: UUID, title: String, progress: Int, total: Int, transactions: [Transaction] = []) {
        self.id = id
        self.title = title
        self.progress = progress
        self.total = total
        self.transactions = transactions
    }
}
