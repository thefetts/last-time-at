import UIKit
import SnapKit

class TitleFieldCell: UITableViewCell {
    init(title: String, delegate: UITextFieldDelegate) {
        super.init(style: .default, reuseIdentifier: "TitleCell")

        if let label = textLabel {
            label.text = "Title"

            let field = UITextField()
            field.font = .systemFont(ofSize: 24)
            field.text = title
            field.textAlignment = .center
            field.delegate = delegate
            addSubview(field)
            field.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(150)
                make.trailing.equalToSuperview().offset(-8)
                make.height.equalToSuperview()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
