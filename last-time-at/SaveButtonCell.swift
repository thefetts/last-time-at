import UIKit
import SnapKit

class SaveButtonCell: UITableViewCell {
    init(delegate: UIGestureRecognizerDelegate) {
        super.init(style: .default, reuseIdentifier: "SaveCell")

        let button = UIButton(type: .roundedRect)
        button.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0.5, alpha: 1)
        button.setTitle("SAVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        if let label = button.titleLabel {
            label.font = .boldSystemFont(ofSize: 18)
        }
        addSubview(button)

        button.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalToSuperview()
        }

        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.delegate = delegate
        button.addGestureRecognizer(tapRecognizer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
