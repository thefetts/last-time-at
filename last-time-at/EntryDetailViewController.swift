import UIKit

class EntryDetailViewController: UITableViewController, UIPickerViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {
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

        let tapGR = UITapGestureRecognizer(target: self.view, action: Selector("endEditing:"))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }


    // MARK: UITableViewController

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }


    // MARK: UITextFieldDelegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        entry.title = textField.text ?? ""
    }


    // MARK: UIGestureRecognizerDelegate

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        navigationController?.popViewController(animated: true)
        print("entry title: \(entry.title)")
        return true
    }


    // MARK: UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "⭐️" * ratings[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        entry.rating = ratings[row]
    }
}
