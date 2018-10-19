import UIKit

extension EntryDetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        navigationController?.popViewController(animated: true)
        return true
    }
}
