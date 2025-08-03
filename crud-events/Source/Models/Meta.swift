import Foundation

class Meta: Codable {
    let id: UUID
    let title: String
    let progress: Int
    let total: Int

    init(title: String, total: Int) {
        self.id = UUID()
        self.title = title
        self.progress = 0
        self.total = total
    }
}
