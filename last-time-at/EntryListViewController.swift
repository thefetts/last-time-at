import UIKit

class EntryListViewController: UITableViewController, UIGestureRecognizerDelegate {
    var entryStore: EntryStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 65
        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryStore.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") ?? UITableViewCell(style: .value1, reuseIdentifier: "EntryCell")
        let entry = entryStore.entries[indexPath.row]

        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.rating⭐

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entryStore.entries[indexPath.row]
        let detailViewController = EntryDetailViewController(entry: entry, row: indexPath.row)
        detailViewController.delegate = self
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = entryStore.entries[indexPath.row]

            let ac = UIAlertController(title: "Delete \(entry.title)", message: "Are you sure you want to delete this item?", preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            ac.addAction(cancelAction)

            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                self.entryStore.removeEntry(entry)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)

            present(ac, animated: true, completion: nil)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        entryStore.moveEntry(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.reloadData()
    }
}

extension EntryListViewController: EntryDetailViewControllerDelegate {
    func entryDetailViewController(newValue: Entry, for row: Int) {
        entryStore.entries[row] = newValue
        navigationController?.popViewController(animated: true)
    }
}
