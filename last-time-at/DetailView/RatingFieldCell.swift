import UIKit
import SnapKit

protocol RatingFieldCellDelegate: class {
    func ratingFieldCell(didSelect: Int)
}

class RatingFieldCell: UITableViewCell {
    private let ratings = [5, 4, 3, 2, 1]
    private let picker = UIPickerView()
    weak var delegate: RatingFieldCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textLabel?.text = "Rating"
        picker.dataSource = self
        picker.delegate = self

        addSubview(picker)

        picker.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(150)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func pick(rating: Int) {
        let currentSelection = ratings.firstIndex(of: rating) ?? 0
        picker.selectRow(currentSelection, inComponent: 0, animated: false)
    }
}

extension RatingFieldCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ratings.count
    }
}

extension RatingFieldCell: UIPickerViewDelegate {
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 48
    }

    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = view as? UILabel ?? UILabel()
        label.text = ratings[row]⭐
        label.textAlignment = .center
        let hue = CGFloat(ratings.count - 1 - row) / CGFloat(ratings.count)
        label.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        return label
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.ratingFieldCell(didSelect: ratings[row])
    }
}
