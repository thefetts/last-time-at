import UIKit

class DetailViewController: UIViewController {
    var entry: Entry! {
        didSet {
            navigationItem.title = entry.title
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
