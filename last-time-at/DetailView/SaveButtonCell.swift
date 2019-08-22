import UIKit
import SnapKit

protocol SaveButtonCellDelegate: class {
    func saveButtonCellDidSave()
}

class SaveButtonCell: UITableViewCell {
    private let button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    weak var delegate: SaveButtonCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)

        addSubview(button)
        button.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @objc
    private func save() {
        delegate?.saveButtonCellDidSave()
    }
}
