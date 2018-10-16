class EntryStore {
    var entries = [Entry]()

    init() {
        entries.append(Entry(title: "Masterpiece Deli", rating: 5))
        entries.append(Entry(title: "Amato's Ale House", rating: 4))
    }

    func removeEntry(_ entry: Entry) {
        if let index = entries.index(of: entry) {
            entries.remove(at: index)
        }
    }
}
