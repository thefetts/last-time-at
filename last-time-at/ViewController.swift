import UIKit

class ViewController: UITableViewController {
    var entryStore: EntryStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
    }
}
