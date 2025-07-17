import Foundation

class Goal: Codable {
    let id: String
    let title: String
    let progress: Int
    let total: Int

    init(id: String, title: String, progress: Int, total: Int) {
        self.id = id
        self.title = title
        self.progress = progress
        self.total = total
    }

    enum CodingKeys: String, CodingKey {
        case id, title, progress, total
    }
}
