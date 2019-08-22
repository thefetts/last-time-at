import UIKit
import SnapKit

class TitleFieldCell: UITableViewCell {
    let field: UITextField = {
        let field = UITextField()
        field.font = .systemFont(ofSize: 24)
        field.textAlignment = .center
        return field
    }()

    init() {
        super.init(style: .default, reuseIdentifier: "TitleCell")

        if let label = textLabel {
            label.text = "Title"

            addSubview(field)
            field.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(150)
                make.trailing.equalToSuperview().offset(-8)
                make.height.equalToSuperview()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
