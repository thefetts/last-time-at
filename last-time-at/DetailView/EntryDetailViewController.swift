import UIKit

protocol EntryDetailViewControllerDelegate: class {
    func entryDetailViewController(newValue: Entry, for row: Int)
}

class EntryDetailViewController: UITableViewController {
    private let titleFieldCell = TitleFieldCell()
    private let ratingFieldCell = RatingFieldCell()
    private let saveButtonCell = SaveButtonCell()

    private var entry: Entry
    private var row: Int
    private let cells: [UITableViewCell]

    weak var delegate: EntryDetailViewControllerDelegate?

    init(entry: Entry, row: Int) {
        self.entry = entry
        self.row = row
        cells = [
            titleFieldCell,
            ratingFieldCell,
            UITableViewCell(),
            saveButtonCell
        ]
        super.init(style: .plain)

        tableView.rowHeight = 65
        tableView.separatorStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleFieldCell.field.delegate = self
        titleFieldCell.field.text = entry.title
        ratingFieldCell.delegate = self
        ratingFieldCell.pick(rating: entry.rating)
        saveButtonCell.delegate = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
}

extension EntryDetailViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        entry.title = textField.text ?? ""
    }
}

extension EntryDetailViewController: RatingFieldCellDelegate {
    func ratingFieldCell(didSelect rating: Int) {
        entry.rating = rating
    }
}

extension EntryDetailViewController: SaveButtonCellDelegate {
    func saveButtonCellDidSave() {
        delegate?.entryDetailViewController(newValue: entry, for: row)
    }
}
