import UIKit

struct Entry: Equatable {
    var title: String
    var rating: Int
    let dateCreated: Date

    init(title: String, rating: Int) {
        self.title = title
        self.rating = rating
        self.dateCreated = Date()
    }
}
