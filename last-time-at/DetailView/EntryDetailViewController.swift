import UIKit

class EntryDetailViewController: UITableViewController {
    var cells: [UITableViewCell]!
    var entry: Entry!
    let ratings = [5, 4, 3, 2, 1]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 65
        tableView.separatorStyle = .none

        cells = [
            TitleFieldCell(title: entry.title, delegate: self),
            RatingFieldCell(data: ratings, rating: entry.rating, delegate: self),
            UITableViewCell(),
            SaveButtonCell(delegate: self)
        ]

        let tapGR = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}
