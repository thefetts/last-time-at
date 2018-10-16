import UIKit

class ViewController: UITableViewController {
    var entryStore: EntryStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EntryCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryStore.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell")!
        let entry = entryStore.entries[indexPath.row]

        cell.textLabel?.text = entry.title
        return cell
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
}
