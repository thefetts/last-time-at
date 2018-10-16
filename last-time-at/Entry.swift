import UIKit

class Entry: NSObject {
    var title: String
    var rating: Int
    var dateCreated: Date

    init(title: String, rating: Int) {
        self.title = title
        self.rating = rating
        self.dateCreated = Date()

        super.init()
    }
}
