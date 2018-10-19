import UIKit

extension EntryDetailViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        entry.title = textField.text ?? ""
    }
}
